import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/domain/admin/search_notifier.dart';

class SearchUserPage extends ConsumerWidget {
  const SearchUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(searchNotifierProvider);
    final searchController = TextEditingController();
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
                controller: searchController,
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
                    return GestureDetector(
                      onTap: () {
                        context.push('/data-user', extra: data[index]);
                      },
                      child: ListTile(
                        title: Text('${data[index]['nama']}',
                            style: const TextStyle(fontSize: 16)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
