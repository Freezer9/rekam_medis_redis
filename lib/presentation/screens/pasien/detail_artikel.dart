import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/domain/admin/artikel_provider.dart';
import 'package:rekam_medis_redis/presentation/widgets/artikel_card.dart';

class DetailArtikel extends ConsumerStatefulWidget {
  const DetailArtikel({
    super.key,
  });

  @override
  ConsumerState<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends ConsumerState<DetailArtikel> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(artikelNotifierProvider.notifier).getAllArtikel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(artikelNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengumuman"),
        backgroundColor: const Color(0xFFA2C9FE),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ArtikelCard(
                    data: data[index],
                    substring: false,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
