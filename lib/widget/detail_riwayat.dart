import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailRiwayat extends StatefulWidget {
  @override
  _DetailRiwayatState createState() => _DetailRiwayatState();
}

class _DetailRiwayatState extends State<DetailRiwayat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catatan Dokter',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/keluhan.png', // Sesuaikan dengan path gambar ikon keluhan
                    width: 24, // Sesuaikan dengan lebar ikon
                    height: 24, // Sesuaikan dengan tinggi ikon
                  ),
                  SizedBox(width: 8), // Spasi antara ikon dan teks "Keluhan"
                  Text(
                    'Keluhan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol "Radang" diklik
                    },
                    child: Text('Radang'),
                  ),
                  SizedBox(
                      width:
                          8), // Spasi antara tombol "Radang" dan "Batuk Berdahak"
                  ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol "Batuk Berdahak" diklik
                    },
                    child: Text('Batuk Berdahak'),
                  ),
                  SizedBox(
                      width:
                          8), // Spasi antara tombol "Batuk Berdahak" dan "Muntah"
                  ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol "Muntah" diklik
                    },
                    child: Text('Muntah'),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Divider(),
              SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    'assets/riwayat.png', // Sesuaikan dengan path gambar ikon keluhan
                    width: 24, // Sesuaikan dengan lebar ikon
                    height: 24, // Sesuaikan dengan tinggi ikon
                  ),
                  SizedBox(width: 8), // Spasi antara ikon dan teks "Keluhan"
                  Text(
                    'Riwayat Penyakit',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol "Corona" diklik
                    },
                    child: Text('Corona'),
                  ),
                  SizedBox(width: 8), // Spasi antara tombol "Corona" dan "Asma"
                  ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol "Asma" diklik
                    },
                    child: Text('Asma'),
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    'assets/diagnosis.png', // Sesuaikan dengan path gambar ikon keluhan
                    width: 24, // Sesuaikan dengan lebar ikon
                    height: 24, // Sesuaikan dengan tinggi ikon
                  ),
                  SizedBox(width: 8), // Spasi antara ikon dan teks "Keluhan"
                  Text(
                    'Diagnosis',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text('Infeksi Saluran Pernapasan Akut'),
              Divider(),
              SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    'assets/resep.png', // Sesuaikan dengan path gambar ikon keluhan
                    width: 24, // Sesuaikan dengan lebar ikon
                    height: 24, // Sesuaikan dengan tinggi ikon
                  ),
                  SizedBox(width: 8), // Spasi antara ikon dan teks "Keluhan"
                  Text(
                    'Resep',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mucera 30 mg 10 Tablet'),
                  SizedBox(height: 4),
                  Wrap(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Corona" diklik
                        },
                        child: Text('Setelah makan'),
                      ),
                      SizedBox(
                          width: 8), // Spasi antara tombol "Corona" dan "Asma"
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Asma" diklik
                        },
                        child: Text('3 x sehari'),
                      ),
                      SizedBox(
                          width: 8), // Spasi antara tombol "Corona" dan "Asma"
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Asma" diklik
                        },
                        child: Text('2 tablet sekali'),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0), // Menggeser teks "Catatan:" ke kanan
                    child: Text('Catatan: Antibiotik, habiskan'),
                  ),
                  Divider(),
                  Text('Cefadroxil 500 mg 10 Kapsul'),
                  SizedBox(height: 4),
                  Wrap(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Corona" diklik
                        },
                        child: Text('Sebelum makan'),
                      ),
                      SizedBox(
                          width: 8), // Spasi antara tombol "Corona" dan "Asma"
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Asma" diklik
                        },
                        child: Text('3 x sehari'),
                      ),
                      SizedBox(
                          width: 8), // Spasi antara tombol "Corona" dan "Asma"
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Asma" diklik
                        },
                        child: Text('2 kapsul'),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0), // Menggeser teks "Catatan:" ke kanan
                    child: Text('Catatan: Antibiotik, habiskan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
