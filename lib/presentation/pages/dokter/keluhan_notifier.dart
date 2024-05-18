import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListNotifier extends StateNotifier<List<String>> {
  ListNotifier() : super([]);

  void addItem(String item) {
    if (!state.contains(item)) {
      state = [...state, item];
    }
  }

  void removeItem(String item) {
    state = state.where((i) => i != item).toList();
  }

  void clearItems() {
    state = [];
  }
}
