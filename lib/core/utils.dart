import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension ClearAndNavigate on BuildContext {
  void clearAndNavigate(String path) {
    while (canPop()) {
      pop();
    }
    pushReplacement(path);
  }
}

String getSupabaseImage(String path) {
  return 'https://kytlboobxypxkuaesorc.supabase.co/storage/v1/object/public/$path';
}
