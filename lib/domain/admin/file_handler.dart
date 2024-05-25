import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gpassword/gpassword.dart';
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
        final input = File(file.path).readAsLinesSync();
        if (type == true) {
          for (int i = 1; i < input.length; i++) {
            final data = input[i].split(',');
            records.add({
              'nrp': data[0],
              'email': data[1],
              'nama': data[2],
              'prodi': data[3],
              'ttl': data[4],
              'tahun': data[5],
            });

            records.removeWhere((element) => element.containsValue(''));
          }
          for (int i = 0; i < records.length; i++) {
            GPassword gPassword = GPassword();
            String password = gPassword.generate(passwordLength: 8);
            final auth =
                await _client.auth.admin.createUser(AdminUserAttributes(
              email: records[i]["email"],
              password: password,
              emailConfirm: true,
            ));

            records[i]["id"] = auth.user!.id;
            records[i]["created_at"] = DateTime.now().toIso8601String();

            await _client.from('mahasiswa').insert(records[i]);

            records[i]["password"] = password;
          }
        } else {
          for (int i = 1; i < input.length; i++) {
            final data = input[i].split(',');
            records.add({
              'sip': data[0],
              'email': data[1],
              'nama': data[2],
              'ttl': data[3],
            });

            records.removeWhere((element) => element.containsValue(''));
          }
          for (int i = 0; i < records.length; i++) {
            GPassword gPassword = GPassword();
            String password = gPassword.generate(passwordLength: 8);
            final auth =
                await _client.auth.admin.createUser(AdminUserAttributes(
              email: records[i]["email"],
              password: password,
              emailConfirm: true,
            ));

            records[i]["id"] = auth.user!.id;
            records[i]["created_at"] = DateTime.now().toIso8601String();

            await _client.from('dokter').insert(records[i]);

            records[i]["password"] = password;

            print(records[i]);
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
                      FileStorage.writeCounter(csvContent, 'user_data.csv');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('File User_Data berhasil disimpan')),
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
  }

  String _convertToCSV(List<Map<String, dynamic>> data) {
    if (data.isEmpty) return '';

    final headers = data.first.keys.join(',');
    final rows = data.map((row) {
      return row.values.map((value) => value.toString()).join(',');
    }).join('\n');

    return '$headers\n$rows';
  }
}
