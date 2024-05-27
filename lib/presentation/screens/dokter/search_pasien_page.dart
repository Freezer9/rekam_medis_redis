import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/data/enums/pasien.dart';
import 'package:rekam_medis_redis/domain/admin/search_notifier.dart';

class SearchPasienPage extends ConsumerWidget {
  const SearchPasienPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(searchNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search User'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextField(
                controller: TextEditingController(),
                onSubmitted: (value) async {
                  ref.read(searchNotifierProvider.notifier).searchUser(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Search User',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final pasienData = data[index];
                    return patientsData.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              context.push('/riwayat-pasien',
                                  extra: pasienData);
                            },
                            child: ListTile(
                              title: Text(pasienData.nama,
                                  style: const TextStyle(fontSize: 16)),
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
