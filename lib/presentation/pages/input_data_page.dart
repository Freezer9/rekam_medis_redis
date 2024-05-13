import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:rekam_medis_redis/presentation/pages/dashboard/dashboard_admin_page.dart';
import 'package:rekam_medis_redis/presentation/widget/selected_file_widget.dart';
import 'package:rekam_medis_redis/presentation/widget/unselected_file_widget.dart';

class InputData extends StatefulWidget {
  const InputData({Key? key}) : super(key: key);

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  List<File> _selectedFiles = [];

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     title: Text(
    //       "Input Data Dokter",
    //       textAlign: TextAlign.center,
    //       style: TextStyle(
    //           color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
    //     ),
    //     centerTitle: true,
    //     leading: IconButton(
    //       icon: const Icon(
    //         Icons.arrow_back,
    //         color: Colors.black,
    //       ),
    //       onPressed: () {},
    //     ),
    //     bottom: PreferredSize(
    //       child: Container(
    //         decoration: BoxDecoration(
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.black.withOpacity(0.2),
    //               spreadRadius: 0.5,
    //             ),
    //           ],
    //         ),
    //       ),
    //       preferredSize: Size.fromHeight(1.0), // Tinggi bayangan
    //     ),
    //   ),
    //   backgroundColor: Colors.white,
    //   body: Center(
    //     child: Column(
    //       children: [
    //         Expanded(
    //           child: ListView.builder(
    //             itemCount: _selectedFiles.length + 1,
    //             itemBuilder: (context, index) {
    //               if (index == _selectedFiles.length) {
    //                 return UnSelectedFile(onPressed: _pickFile);
    //               }
    //               return SelectedFile(_selectedFiles[index]);
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: Container(
    //     width: 320, // Sesuaikan dengan lebar SelectedFile
    //     margin: EdgeInsets.all(20), // Atur margin sesuai kebutuhan
    //     child: ElevatedButton(
    //       onPressed: () {
    //         // Aksi yang ingin dilakukan saat tombol ditekan
    //       },
    //       child: Text(
    //         'Simpan',
    //         style: TextStyle(
    //             color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
    //       ), // Teks pada tombol
    //       style: ElevatedButton.styleFrom(
    //         backgroundColor: Color(0xFF5195D6), // Warna latar belakang tombol
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(10), // Bentuk tombol
    //         ),
    //         elevation: 5,
    //       ),
    //     ),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Input Data Dokter",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashboardAdminPage()),
            );
          },
        ),
        bottom: PreferredSize(
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
          preferredSize: Size.fromHeight(1.0), // Tinggi bayangan
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
        margin: EdgeInsets.all(20), // Atur margin sesuai kebutuhan
        child: ElevatedButton(
          onPressed: () {
            _selectedFiles.isNotEmpty ? _saveFiles() : null; 
          },
          child: Text(
            'Simpan',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ), // Teks pada tombol
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedFiles.isNotEmpty ? Color(0xFF5195D6) : Colors.grey, // Warna latar belakang tombol
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Bentuk tombol
            ),
            elevation: 5,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Widget SelectedFile(File selectedFile) {
  //   return Container(
  //     margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
  //     padding: EdgeInsets.all(17.0),
  //     width: 320,
  //     height: 110,
  //     decoration: BoxDecoration(
  //       color: Color(0xFF5195D6),
  //       borderRadius: BorderRadius.circular(10),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.5),
  //           spreadRadius: 0.1,
  //           blurRadius: 5,
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Image.asset(
  //           'assets/icons/csv-icon.png',
  //           height: 50,
  //           width: 50,
  //         ),
  //         SizedBox(
  //           width: 10.0,
  //         ),
  //         Expanded(
  //           child: Text(
  //             path.basename(selectedFile.path), // Menampilkan nama file
  //             style:
  //                 TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
  //             overflow: TextOverflow.ellipsis, // Mengatasi overflow
  //           ),
  //         ),
  //         IconButton(
  //           icon: Icon(
  //             Icons.close,
  //             color: Color(0xFFBA1A1A),
  //           ),
  //           onPressed: () {
  //             setState(() {
  //               _selectedFiles
  //                   .remove(selectedFile); // Menghapus file yang terpilih
  //             });
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }

  // // Widget UnSelectedFile({required VoidCallback onPressed}) {
  //   return GestureDetector(
  //     onTap: onPressed,
  //     child: Container(
  //       margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
  //       width: 320,
  //       height: 110,
  //       child: DottedBorder(
  //         color: Color(0xFF38608F).withOpacity(0.5),
  //         dashPattern: [10, 10],
  //         strokeWidth: 2,
  //         radius: Radius.circular(10),
  //         borderType: BorderType.RRect,
  //         child: Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Icon(
  //                 Icons.add,
  //                 color: Color(0xFF38608F).withOpacity(0.5),
  //               ),
  //               Text(
  //                 "Click to Select File",
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     color: Color(0xFF38608F).withOpacity(0.5),
  //                     fontWeight: FontWeight.w500),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
            title: Text('Invalid File'),
            content: Text('Only CSV and XLSX files are allowed.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
  void _saveFiles() {
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
        title: Text('Invalid File'),
        content: Text('One or more selected files are invalid. Only CSV and XLSX files are allowed.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  } else {
    // Implementasi logika penyimpanan file
  }
}

}
