import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/data/faker/resep.dart';

class InputDataMedisPage extends ConsumerStatefulWidget {
  const InputDataMedisPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputDataPageState();
}

class _InputDataPageState extends ConsumerState<InputDataMedisPage> {
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
              boxContent("Keluhan", keluhan),
              boxContent("Riwayat Penyakit", riwayatPenyakit),
              boxContent("Diagnosis", diagnosis),
            ],
          ),
        ),
      ),
    );
  }

  Widget boxContent(String title, List<String> data) {
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
          autoCompleteTextField(data),
        ],
      ),
    );
  }

  Widget autoCompleteTextField(List<String> data) {
    return Autocomplete(
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
              borderSide:
                  const BorderSide(color: Color(0xFF38608F), width: 2.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          ),
          onChanged: (value) {},
        );
      },
    );
  }
}
