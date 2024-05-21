import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/data/faker/resep.dart';
import 'package:rekam_medis_redis/presentation/pages/dokter/keluhan_notifier.dart';

final keluhanProvider =
    StateNotifierProvider<ListNotifier, List<String>>((ref) {
  return ListNotifier();
});
final riwayatPenyakitProvider =
    StateNotifierProvider<ListNotifier, List<String>>((ref) {
  return ListNotifier();
});
final diagnosisProvider =
    StateNotifierProvider<ListNotifier, List<String>>((ref) {
  return ListNotifier();
});

class InputDataMedisPage extends ConsumerStatefulWidget {
  const InputDataMedisPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputDataPageState();
}


class _InputDataPageState extends ConsumerState<InputDataMedisPage> {
  // void initState() {
  //   super.initState();
  //   // Clear all lists when the page is loaded
  //   Future.microtask(() {
  //     ref.read(keluhanProvider.notifier).clearItems();
  //     ref.read(riwayatPenyakitProvider.notifier).clearItems();
  //     ref.read(diagnosisProvider.notifier).clearItems();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Input Data Pasien',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 35, right: 35, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              listBoxContent("Keluhan", keluhan, keluhanProvider),
              listBoxContent(
                  "Riwayat Penyakit", riwayatPenyakit, riwayatPenyakitProvider),
              listBoxContent("Diagnosis", diagnosis, diagnosisProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget listBoxContent(String title, List<String> data,
      StateNotifierProvider<ListNotifier, List<String>> provider) {
    return Consumer(builder: (context, ref, child) {
      final itemList = ref.watch(provider);
      return SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            autoCompleteTextField(data, (selectedItem) {
              ref.read(provider.notifier).addItem(selectedItem);
            }),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: itemList
                  .map((item) => Chip(
                        label: Text(item,
                            style: const TextStyle(color: Color(0xFF001C37))),
                        backgroundColor: Color(0xFFD2E4FF),
                        onDeleted: () {
                          ref.read(provider.notifier).removeItem(item);
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      );
    });
  }

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
      onSelected: (selectedOption) {
        onSelected(selectedOption);
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xFF38608F), width: 2.0),
              borderRadius: BorderRadius.circular(5.0),
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
          onChanged: (value) {},
        );
      },
    );
  }
}
