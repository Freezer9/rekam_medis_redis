import 'package:flutter/material.dart';
import '../datafake/keluhan.dart';

class CustomAutoComplete extends StatefulWidget {
  final dynamic search;
  final dynamic onSelected;
  final dynamic onSubmitted;

  const CustomAutoComplete(
      {super.key,
      required this.search,
      required this.onSelected,
      required this.onSubmitted});

  @override
  State<CustomAutoComplete> createState() => _CustomAutoCompleteState();
}

class _CustomAutoCompleteState extends State<CustomAutoComplete> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Autocomplete<Keluhan>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<Keluhan>.empty();
            }
            return keluhan.where((Keluhan Keluhan) {
              return Keluhan.name
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          displayStringForOption: (Keluhan option) => option.name,
          onSelected: (Keluhan selection) {
            widget.onSelected(selection);
          },
          fieldViewBuilder: (BuildContext context,
              TextEditingController textEditingController,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted) {
            return TextField(
              controller: textEditingController,
              focusNode: focusNode,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onSubmitted: (value) {
                if (widget.search.isNotEmpty) {
                  widget.onSubmitted(value);
                  onFieldSubmitted();
                }
                textEditingController.clear();
              },
            );
          },
        ),
        if (widget.search.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Riwayat Keluhan:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  children: widget.search.map((query) {
                    return Chip(
                      label: Text(query),
                      onDeleted: () {
                        setState(() {
                          widget.search.remove(query);
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
