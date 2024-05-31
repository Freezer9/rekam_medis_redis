import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gpassword/gpassword.dart';
import 'package:excel/excel.dart';
import 'package:rekam_medis_redis/domain/admin/file_input.dart';

class FileHandler {
  Future<List<File>> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['csv', 'xlsx'],
    );

    if (result != null) {
      List<File> newFiles = result.paths.map((path) => File(path!)).toList();
      bool allValid = true;

      for (File file in newFiles) {
        String extension = path.extension(file.path).toLowerCase();
        if (extension != '.csv' && extension != '.xlsx') {
          allValid = false;
          break;
        }
      }

      if (allValid) {
        return newFiles;
      } else {
        throw Exception('Invalid File');
      }
    }
    return [];
  }

  Future<bool> saveFiles(
      List<File> selectedFiles, BuildContext context, bool type) async {
    bool hasInvalidFiles = false;

    for (File file in selectedFiles) {
      String extension = path.extension(file.path).toLowerCase();
      if (extension != '.csv' && extension != '.xlsx') {
        hasInvalidFiles = true;
        break;
      }
    }

    if (hasInvalidFiles) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid File'),
          content: const Text(
              'One or more selected files are invalid. Only CSV and XLSX files are allowed.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return false;
    } else {
      final _client = Supabase.instance.client;
      final records = <Map<String, dynamic>>[];
      for (File file in selectedFiles) {
        String extension = path.extension(file.path).toLowerCase();
        if (extension == '.csv') {
          final input = File(file.path).readAsLinesSync();
          List<String> headers = input[0].split(',');
          for (int i = 1; i < input.length; i++) {
            final data = input[i].split(',');
            Map<String, dynamic> record = Map<String, dynamic>();
            for (int j = 0; j < headers.length; j++) {
              record[headers[j]] = data[j];
            }
            records.add(record);
          }
        } else if (extension == '.xlsx') {
          var bytes = File(file.path).readAsBytesSync();
          var excel = Excel.decodeBytes(bytes);

          for (var table in excel.tables.keys) {
            var sheet = excel.tables[table];
            if (sheet != null) {
              List<String> headers = sheet.rows.first
                  .map((cell) => cell?.value.toString() ?? '')
                  .toList();
              for (int i = 1; i < sheet.rows.length; i++) {
                var row = sheet.rows[i];
                Map<String, dynamic> record = Map<String, dynamic>();
                for (int j = 0; j < headers.length; j++) {
                  record[headers[j]] = row[j]?.value.toString() ?? '';
                }
                records.add(record);
              }
            }
          }
        }

        records.removeWhere((element) =>
            element.containsValue(null) || element.containsValue(''));
      }
      for (int i = 0; i < records.length; i++) {
        if (records[i]['email'] != null && records[i]['email'] != '') {
          GPassword gPassword = GPassword();
          String password = gPassword.generate(passwordLength: 8);
          final List<User> users = await _client.auth.admin.listUsers();
          bool userExist =
              users.any((user) => user.email == records[i]['email']);

          if (!userExist) {
            final auth =
                await _client.auth.admin.createUser(AdminUserAttributes(
              email: records[i]['email'],
              password: password,
              emailConfirm: false,
            ));
            records[i]['id'] = auth.user!.id;
            records[i]['created_at'] = DateTime.now().toIso8601String();

            if (type == true) {
              await _client.from('mahasiswa').insert(records[i]);
            } else {
              await _client.from('dokter').insert(records[i]);
            }

            records[i].removeWhere((key, value) => key == 'id');
            records[i]["password"] = password;
          }
        } else {
          print('Email field is missing or empty.');
        }
      }
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text('Sukses'),
            content: const Text('File berhasil disimpan'),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  try {
                    final csvContent = _convertToCSV(records);
                    final currentDateTime =
                        DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
                    final fileName = 'user_data_$currentDateTime.csv';
                    FileStorage.writeCounter(csvContent, fileName);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('File $fileName berhasil disimpan')),
                    );
                  } catch (e) {
                    print('Gagal download file: $e');
                  }
                },
                child: const Text('OK'),
              ),
            ]),
      );
    }
    return true;
  }

  String _convertToCSV(List<Map<String, dynamic>> data) {
    if (data.isEmpty) return '';

    List<String> headers = data.isNotEmpty ? data.first.keys.toList() : [];

    final rows = data.map((row) {
      return headers.map((header) => row[header].toString()).join(',');
    }).join('\n');

    return '${headers.join(',')}\n$rows';
  }
}
