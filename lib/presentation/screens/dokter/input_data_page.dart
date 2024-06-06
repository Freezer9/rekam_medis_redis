// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/data/enums/resep.dart';
import 'package:rekam_medis_redis/data/models/dokter_model.dart';
import 'package:rekam_medis_redis/data/models/pasien_model.dart';
import 'package:rekam_medis_redis/domain/dokter/list_notifier.dart';
import 'package:rekam_medis_redis/domain/dokter/obat_notifier.dart';
import 'package:rekam_medis_redis/domain/dokter/pasien_notifier.dart';
import 'package:rekam_medis_redis/domain/dokter/record_notifier.dart';
import 'package:rekam_medis_redis/presentation/widgets/autocomplete_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/button_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/snackbar.dart';
import 'package:rekam_medis_redis/presentation/widgets/input_dialog.dart';
import 'package:rekam_medis_redis/presentation/widgets/obat_card.dart';
import 'package:rekam_medis_redis/constant/themes.dart';

class InputDataMedisPage extends ConsumerStatefulWidget {
  final PasienModel pasien;
  const InputDataMedisPage({super.key, required this.pasien});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputDataPageState();
}

class _InputDataPageState extends ConsumerState<InputDataMedisPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authUserProvider).asData?.value;
    final loginUser =
        DokterModel.fromJson(user?.userMetadata as Map<String, dynamic>);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Pasien'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primarycolor),
          onPressed: () {
            ref.read(keluhanProvider.notifier).clearItems();
            ref.read(riwayatPenyakitProvider.notifier).clearItems();
            ref.read(diagnosisProvider.notifier).clearItems();
            ref.read(obatNotifierProvider.notifier).clearObat();
            Navigator.pop(context);
          },
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
              const SizedBox(height: 20),
              buttonSimpan(
                onPressed: () async {
                  if (ref.read(keluhanProvider).isEmpty ||
                      ref.read(riwayatPenyakitProvider).isEmpty ||
                      ref.read(diagnosisProvider).isEmpty ||
                      ref.read(obatNotifierProvider).isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        buildErrorSnackBar("Data tidak boleh kosong"));
                    return;
                  } else {
                    ref.read(recordProvider.notifier).addRecord(
                          ref.read(keluhanProvider),
                          ref.read(riwayatPenyakitProvider),
                          ref.read(diagnosisProvider),
                          widget.pasien.id.toString(),
                          loginUser.id,
                        );

                    final id = await ref
                        .read(recordProvider.notifier)
                        .simpanRecordDatabase();

                    await ref
                        .read(obatNotifierProvider.notifier)
                        .simpanObatDatabase(id[0]['id'].toString())
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        buildSuccessSnackBar("Data berhasil disimpan"),
                      );

                      ref.invalidate(getAllPasienProvider(loginUser.id));
                      ref.read(keluhanProvider.notifier).clearItems();
                      ref.read(riwayatPenyakitProvider.notifier).clearItems();
                      ref.read(diagnosisProvider.notifier).clearItems();
                      ref.read(obatNotifierProvider.notifier).clearObat();

                      Navigator.pop(context);
                    });
                  }
                },
                btnColor: buttonColor2,
                textColor: Colors.white,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget tambahResepContent() {
    return Consumer(
      builder: (context, ref, child) {
        final obatList = ref.watch(obatNotifierProvider);
        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Resep Obat",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: obatList.length,
                itemBuilder: (context, index) {
                  final obat = obatList[index];
                  return ObatCard(obat: obat, index: index);
                },
              ),
              buttonTambahResep(),
            ],
          ),
        );
      },
    );
  }

  Widget buttonTambahResep() {
    return GestureDetector(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (_) {
            return InputObatDialog();
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
          autoCompleteTextField(
            data: data,
            onSelected: (selectedItem) {
              ref.read(provider.notifier).addItem(selectedItem);
            },
            clearOnSubmit: true,
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            children: itemList
                .map(
                  (item) => Chip(
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
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
