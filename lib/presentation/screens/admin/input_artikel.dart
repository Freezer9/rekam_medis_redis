// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rekam_medis_redis/constant/themes.dart';
import 'package:rekam_medis_redis/domain/admin/artikel_provider.dart';
import 'package:rekam_medis_redis/presentation/widgets/button_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/snackbar.dart';

class InputArtikel extends ConsumerStatefulWidget {
  const InputArtikel({super.key});

  @override
  ConsumerState<InputArtikel> createState() => _InputArtikelState();
}

class _InputArtikelState extends ConsumerState<InputArtikel> {
  File? selectedImage;
  final TextEditingController judulController = TextEditingController();
  final TextEditingController isiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Pengumuman'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              selectedImage != null
                  ? GestureDetector(
                      onTap: () {
                        pickImageFromGallery();
                      },
                      child: Center(
                        child: Image.file(
                          selectedImage!,
                          fit: BoxFit.fitHeight,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        pickImageFromGallery();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 80, bottom: 80),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image),
                            SizedBox(width: 10),
                            Text("Input your image")
                          ],
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              titleTextField("Judul"),
              const SizedBox(height: 10),
              inputTextField(
                  maxLines: 1,
                  hint: 'Masukkan Judul Pengumuman',
                  controller: judulController),
              const SizedBox(height: 20),
              titleTextField("Isi"),
              const SizedBox(height: 10),
              inputTextField(
                  maxLines: 7,
                  hint: 'Masukkan Isi Pengumuman',
                  controller: isiController),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: buttonSimpan(
                  btnColor: buttonColor2,
                  textColor: Colors.white,
                  onPressed: () {
                    if (judulController.text.isEmpty ||
                        isiController.text.isEmpty ||
                        selectedImage == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          buildErrorSnackBar("Semua field harus diisi!"));
                    } else {
                      ref
                          .read(artikelNotifierProvider.notifier)
                          .insertDatabase(judulController.text,
                              isiController.text, selectedImage!)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          buildSuccessSnackBar("Berhasil menambah pengumuman!"),
                        );
                      }).whenComplete(() => Navigator.pop(context));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleTextField(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget inputTextField(
      {String? hint, TextEditingController? controller, int? maxLines}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: primarycolor, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
    );
  }

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(returnedImage!.path);
    });
  }
}
