import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/data/models/pasien_model.dart';
import 'package:rekam_medis_redis/domain/admin/search_notifier.dart';

class SearchPasienPage extends ConsumerWidget {
  const SearchPasienPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(searchNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Pasien'),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                  controller: TextEditingController(),
                  onSubmitted: (value) async {
                    ref.read(searchNotifierProvider.notifier).searchUser(value);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Mahasiswa / dosen',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final pasienData = data[index];
                    return pasienData is PasienModel
                        ? GestureDetector(
                            onTap: () {
                              context.push('/riwayat-pasien',
                                  extra: pasienData);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 25, right: 25, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                              ),
                              child: ListTile(
                                leading: const Icon(Icons.person),
                                title: Text(pasienData.nama,
                                    style: const TextStyle(fontSize: 16)),
                              ),
                            ),
                          )
                        : const Center(
                            child: Text('Data tidak ditemukan'),
                          );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
