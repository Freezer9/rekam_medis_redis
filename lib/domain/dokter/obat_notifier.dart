import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'obat_notifier.g.dart';

@riverpod
class ObatNotifier extends _$ObatNotifier {
  @override
  List<Map<String, dynamic>> build() => [];

  void addObat() {
    state = [...state, {}];
  }

  void deleteObat(int index) {
    state.removeAt(index);
    state = [...state];
  }

  void updateObat(int index, Map<String, dynamic> obat) {
    state[index].addAll(obat);
    state = [...state];
  }
}
