import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multi_select_search/multi_select_search.dart';
import 'package:rekam_medis_redis/datafake/data_input_pasien.dart'; // import package yang diperlukan untuk Contact dan list

class InputDataPasien extends StatefulWidget {
  @override
  _InputDataPasienState createState() => _InputDataPasienState();
}

class _InputDataPasienState extends State<InputDataPasien> {
  String keluhanPasien = "";
  String riwayatPenyakit = "";
  String diagnosis = "";
  List<Contact> selectedItems =
      []; // tambahkan variabel untuk menyimpan item terpilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text("Input Data Pasien"),
            SizedBox(
                width:
                    48.0), // Untuk menyisipkan ruang agar tombol Simpan tidak terlalu dekat dengan judul
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Keluhan Pasien",
                ),
                onChanged: (value) {
                  setState(() {
                    keluhanPasien = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Riwayat Penyakit",
                ),
                onChanged: (value) {
                  setState(() {
                    riwayatPenyakit = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Diagnosis",
                ),
                onChanged: (value) {
                  setState(() {
                    diagnosis = value;
                  });
                },
              ),
              MultiSelectSearch<Contact>(
                itemBuilder: (Contact item) => ListTile(
                  key: ObjectKey(item),
                  leading: const Icon(Icons.person),
                  title: Text(item.name),
                ),
                chipLabelKey: 'name',
                items:
                    list, // ganti 'list' dengan daftar kontak yang Anda miliki
                initialValue: [], // atur nilai awal jika diperlukan
                onChanged: (List<Contact> items) =>
                    setState(() => selectedItems = items),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7A072).withOpacity(0.6),
                  border: const Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                clearAll: const Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 6.0),
                  child: Icon(Icons.clear),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Simpan data pasien ke database
                  // ...
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Data Pasien Disimpan"),
                        content: Text("Data pasien telah disimpan berhasil."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
