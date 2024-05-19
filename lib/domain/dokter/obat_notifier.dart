import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'obat_notifier.g.dart';

@riverpod
class ObatNotifier extends _$ObatNotifier {
  @override
  List<Map<String, dynamic>> build() => [];

  void addObat(String namaObat) {
    state = [
      ...state,
      {"nama_obat": namaObat}
    ];
  }

  void deleteObat(int index) {
    state.removeAt(index);
    state = [...state];
  }
}
