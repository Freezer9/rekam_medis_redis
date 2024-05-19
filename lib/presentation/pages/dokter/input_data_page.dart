import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/data/faker/resep.dart';
import 'package:rekam_medis_redis/domain/dokter/keluhan_notifier.dart';
import 'package:rekam_medis_redis/domain/dokter/obat_notifier.dart';
import 'package:rekam_medis_redis/presentation/widgets/autocomplete_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/button_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/textfield_widget.dart';
import 'package:rekam_medis_redis/themes.dart';

class InputDataMedisPage extends ConsumerStatefulWidget {
  const InputDataMedisPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputDataPageState();
}

class _InputDataPageState extends ConsumerState<InputDataMedisPage> {
  int _kuantitasWaktu = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Data Pasien',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              listBoxContent("Keluhan", keluhan, keluhanProvider),
              listBoxContent(
                  "Riwayat Penyakit", riwayatPenyakit, riwayatPenyakitProvider),
              listBoxContent("Diagnosis", diagnosis, diagnosisProvider),
              tambahResepContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget tambahResepContent() {
    final item = ref.watch(obatNotifierProvider);

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Resep Obat",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(item.toString()),
          buttonTambahResep(item)
        ],
      ),
    );
  }

  Widget buttonTambahResep(List<Map<String, dynamic>> item) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.white,
              insetPadding: const EdgeInsets.only(bottom: 80, top: 40),
              contentPadding: EdgeInsets.zero,
              content: inputFormBox(item),
              actions: [
                buttonSimpan(),
              ],
            );
          },
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/icons/+.png'),
          const SizedBox(width: 5),
          const Text(
            "Tambah Resep",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: primarycolor),
          ),
        ],
      ),
    );
  }

  Widget inputFormBox(List<Map<String, dynamic>> item) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nama Obat",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                autoCompleteTextField(obat, (selectedItem) {
                  ref.read(obatNotifierProvider.notifier).addObat(selectedItem);
                }),
                Text(item.toString()),
                const SizedBox(height: 20),
                const Text(
                  "Kuantitas",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_kuantitasWaktu > 1) {
                          _kuantitasWaktu--;
                        }
                      },
                      child: Image.asset('assets/icons/minus.png'),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      _kuantitasWaktu.toString(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        _kuantitasWaktu++;
                      },
                      child: Image.asset('assets/icons/plus.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Cara Penggunaan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_kuantitasWaktu > 1) {
                              _kuantitasWaktu--;
                            }
                          },
                          child: Image.asset('assets/icons/minus.png'),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          _kuantitasWaktu.toString(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            _kuantitasWaktu++;
                          },
                          child: Image.asset('assets/icons/plus.png'),
                        ),
                      ],
                    ),
                    const Text(
                      "Per hari",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_kuantitasWaktu > 1) {
                          _kuantitasWaktu--;
                        }
                      },
                      child: Image.asset('assets/icons/minus.png'),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      _kuantitasWaktu.toString(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        _kuantitasWaktu++;
                      },
                      child: Image.asset('assets/icons/plus.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Waktu Penggunaan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                DropdownMenu(
                  inputDecorationTheme: const InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  ),
                  dropdownMenuEntries: waktuPenggunaan
                      .map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Catatan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                customTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listBoxContent(String title, List<String> data,
      StateNotifierProvider<ListNotifier, List<String>> provider) {
    final itemList = ref.watch(provider);

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          autoCompleteTextField(data, (selectedItem) {
            ref.read(provider.notifier).addItem(selectedItem);
          }),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            children: itemList
                .map((item) => Chip(
                      label: Text(item,
                          style: const TextStyle(
                              color: Color(0xFF001C37),
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      backgroundColor: const Color(0xFFD2E4FF),
                      padding: const EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      deleteIcon: Image.asset('assets/icons/x.png'),
                      onDeleted: () {
                        ref.read(provider.notifier).removeItem(item);
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
