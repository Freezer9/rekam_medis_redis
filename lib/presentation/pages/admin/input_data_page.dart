import 'dart:io';
import 'package:rekam_medis_redis/presentation/widgets/selected_file_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/unselected_file_widget.dart';
import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/presentation/pages/admin/file_handler.dart';
// import 'package:rekam_medis_redis/presentation/pages/admin/file_input.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:path/path.dart' as path;
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:gpassword/gpassword.dart';

class InputData extends StatefulWidget {
  final String data;
  const InputData({super.key, required this.data});

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  final List<File> _selectedFiles = [];
  final FileHandler _fileHandler = FileHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Input Data ${widget.data}',
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
        width: 320,
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            _selectedFiles.isNotEmpty ? _saveFiles() : null;
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedFiles.isNotEmpty
                ? const Color(0xFF5195D6)
                : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
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
    List<File> newFiles = await _fileHandler.pickFiles();
    setState(() {
      _selectedFiles.addAll(newFiles);
    });
  }

  void _saveFiles() async {
    bool type = true;
    if (widget.data == 'Dokter') {
      type = false;
    }
    bool success = await _fileHandler.saveFiles(_selectedFiles, context, type);
    if (success) {
      setState(() {
        _selectedFiles.clear();
      });
    }
  }
}
