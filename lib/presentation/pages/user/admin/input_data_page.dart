// ignore_for_file: library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:rekam_medis_redis/presentation/widgets/selected_file_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/unselected_file_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gpassword/gpassword.dart';

class InputData extends StatefulWidget {
  const InputData({super.key});

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  final List<File> _selectedFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Input Data Dokter",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 0.5,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _selectedFiles.length + 1,
                itemBuilder: (context, index) {
                  if (index == _selectedFiles.length) {
                    return UnselectedFileWidget(onPressed: _pickFile);
                  }
                  return SelectedFile(
                    selectedFile: _selectedFiles[index],
                    onDelete: () {
                      setState(() {
                        _selectedFiles.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 320, // Sesuaikan dengan lebar SelectedFile
        margin: const EdgeInsets.all(20), // Atur margin sesuai kebutuhan
        child: ElevatedButton(
          onPressed: () {
            _selectedFiles.isNotEmpty ? _saveFiles() : null;
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedFiles.isNotEmpty
                ? const Color(0xFF5195D6)
                : Colors.grey, // Warna latar belakang tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Bentuk tombol
            ),
            elevation: 5,
          ),
          child: const Text(
            'Simpan',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true, // Memungkinkan pemilihan multiple file
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
        setState(() {
          _selectedFiles.addAll(newFiles);
        });
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Invalid File'),
            content: const Text('Only CSV and XLSX files are allowed.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  void _saveFiles() async {
    bool hasInvalidFiles = false;

    for (File file in _selectedFiles) {
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
    } else {
      final _client = Supabase.instance.client;
      final records = <Map<String, dynamic>>[];

      // Implementasi logika penyimpanan file
      _selectedFiles.forEach((file) async {
        final input = File(file.path).readAsLinesSync();

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

          // buang data yang null
          records.removeWhere((element) => element.containsValue(''));
        }

        // Implementasi penyimpanan data ke database
        for (int i = 0; i < records.length; i++) {
          GPassword gPassword = GPassword();
          String password = gPassword.generate(passwordLength: 8);
          final AuthResponse auth = await _client.auth.signUp(
            email: records[i]["email"],
            password: password,
          );

          records[i]["id"] = auth.user!.id;
          records[i]["created_at"] = DateTime.now().toIso8601String();

          final insertData = await _client.from('mahasiswa').insert(records[i]);

          records[i]["password"] = password;

          print(records[i]);

          if (insertData.error != null) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(insertData.error!.message),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Success'),
                content: const Text('Data has been saved successfully.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        }
      });
    }
  }
}
