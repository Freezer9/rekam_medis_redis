import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:rekam_medis_redis/data/models/artikel_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'artikel_provider.g.dart';

@riverpod
class ArtikelNotifier extends _$ArtikelNotifier {
  @override
  List<ArtikelModel> build() {
    return [];
  }

  Future<void> insertDatabase(String judul, String isi, File image) async {
    try {
      final now = DateTime.now();
      final client = Supabase.instance.client;
      final imagePath = const Uuid().v4();

      final String imageFullPath = await client.storage.from('artikel').upload(
            '$imagePath.jpg',
            image,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
          );

      await client.from('artikel').insert({
        'image': imageFullPath,
        'judul': judul,
        'isi': isi,
        'created_at': DateTime(now.year, now.month, now.day).toIso8601String(),
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getAllArtikel() async {
    final client = Supabase.instance.client;
    final List<ArtikelModel> artikel = [];

    await client.from('artikel').select().then((response) {
      for (var data in response) {
        artikel.add(ArtikelModel.fromJson(data));
      }

      state = [...artikel];
    });
  }
}
