import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/domain/admin/search_notifier.dart';

class SearchUserPage extends ConsumerWidget {
  const SearchUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(searchNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search User'),
          centerTitle: true,
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
                    ref
                        .read(searchNotifierProvider.notifier)
                        .searchUserAdmin(value);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Mahasiswa / dosen',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: data.isNotEmpty
                    ? ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final user = data[index];
                          return GestureDetector(
                            onTap: () {
                              context.push('/data-user', extra: user);
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
                                title: Text(user.nama,
                                    style: const TextStyle(fontSize: 16)),
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          'Data tidak ditemukan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
              ),
            ],
          ),
        ));
  }
}
