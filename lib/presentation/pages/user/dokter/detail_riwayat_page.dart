import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailRiwayatPage extends StatefulWidget {
  final Map<String, String> data;

  const DetailRiwayatPage({
    super.key,
    required this.data,
  });

  @override
  _DetailRiwayatPageState createState() => _DetailRiwayatPageState();
}

class _DetailRiwayatPageState extends State<DetailRiwayatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catatan Dokter',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                    'assets/icons/keluhan.png', // Sesuaikan dengan path gambar ikon keluhan
                    width: 24, // Sesuaikan dengan lebar ikon
                    height: 24, // Sesuaikan dengan tinggi ikon
                  ),
                  const SizedBox(
                      width: 8), // Spasi antara ikon dan teks "Keluhan"
                  const Text(
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
                    child: const Text('Radang'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Batuk Berdahak'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Muntah'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/riwayat.png',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
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
                    child: const Text('Corona'),
                  ),
                  const SizedBox(
                      width: 8), // Spasi antara tombol "Corona" dan "Asma"
                  ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol "Asma" diklik
                    },
                    child: const Text('Asma'),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/diagnosis.png', // Sesuaikan dengan path gambar ikon keluhan
                    width: 24, // Sesuaikan dengan lebar ikon
                    height: 24, // Sesuaikan dengan tinggi ikon
                  ),
                  const SizedBox(
                      width: 8), // Spasi antara ikon dan teks "Keluhan"
                  const Text(
                    'Diagnosis',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text('Infeksi Saluran Pernapasan Akut'),
              const Divider(),
              const SizedBox(height: 8),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/resep.png', // Sesuaikan dengan path gambar ikon keluhan
                    width: 24, // Sesuaikan dengan lebar ikon
                    height: 24, // Sesuaikan dengan tinggi ikon
                  ),
                  const SizedBox(
                      width: 8), // Spasi antara ikon dan teks "Keluhan"
                  const Text(
                    'Resep',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Mucera 30 mg 10 Tablet'),
                  const SizedBox(height: 4),
                  Wrap(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Corona" diklik
                        },
                        child: const Text('Setelah makan'),
                      ),
                      const SizedBox(
                          width: 8), // Spasi antara tombol "Corona" dan "Asma"
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Asma" diklik
                        },
                        child: const Text('3 x sehari'),
                      ),
                      const SizedBox(
                          width: 8), // Spasi antara tombol "Corona" dan "Asma"
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Asma" diklik
                        },
                        child: const Text('2 tablet sekali'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 28.0), // Menggeser teks "Catatan:" ke kanan
                    child: Text('Catatan: Antibiotik, habiskan'),
                  ),
                  const Divider(),
                  const Text('Cefadroxil 500 mg 10 Kapsul'),
                  const SizedBox(height: 4),
                  Wrap(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Corona" diklik
                        },
                        child: const Text('Sebelum makan'),
                      ),
                      const SizedBox(
                          width: 8), // Spasi antara tombol "Corona" dan "Asma"
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Asma" diklik
                        },
                        child: const Text('3 x sehari'),
                      ),
                      const SizedBox(
                          width: 8), // Spasi antara tombol "Corona" dan "Asma"
                      ElevatedButton(
                        onPressed: () {
                          // Aksi ketika tombol "Asma" diklik
                        },
                        child: const Text('2 kapsul'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(
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
