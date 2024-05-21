import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/themes.dart';

Widget autoCompleteTextField(List<String> data, Function(String) onSelected) {
  return Autocomplete<String>(
    optionsBuilder: (TextEditingValue textEditingValue) {
      return data.where((option) {
        return option
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase());
      });
    },
    displayStringForOption: (option) {
      return option;
    },
    fieldViewBuilder:
        (context, textEditingController, focusNode, onFieldSubmitted) {
      return TextField(
        controller: textEditingController,
        focusNode: focusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: primarycolor, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            onSelected(value);
            textEditingController.clear();
          }
        },
      );
    },
  );
}
