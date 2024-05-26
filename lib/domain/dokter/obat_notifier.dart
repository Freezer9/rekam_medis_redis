import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObatNotifier extends StateNotifier<List<Map<String, String>>> {
  ObatNotifier() : super([]);

  void addObat(String obat) {
    state = [
      ...state,
      {'nama_obat': obat}
    ];
  }

  void removeObat(String obat) {
    state = state.where((element) => element != obat).toList();
  }

  void clearObat() {
    state = [];
  }
}

final obatNotifierProvider =
    StateNotifierProvider<ObatNotifier, List<Map<String, String>>>((ref) {
  return ObatNotifier();
});
