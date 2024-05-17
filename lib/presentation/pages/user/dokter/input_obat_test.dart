import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/data/faker/obat.dart';
import 'package:rekam_medis_redis/domain/dokter/obat_notifier.dart';

class InputObatTest extends ConsumerStatefulWidget {
  const InputObatTest({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputObatTestState();
}

class _InputObatTestState extends ConsumerState<InputObatTest> {
  String? _selectedType;
  String? _selectedTypeOf;
  int? _selectedWaktu;
  int _kuantitasObat = 1;
  int _kuantitasWaktu = 1;
  int _kuantitasTipe = 1;

  final List<TextEditingController> textController = [];

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(obatNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Resep Obat", style: TextStyle(fontSize: 18)),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...data.map((e) => expansionTileContainer(data.indexOf(e))),
              bottomButtonContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget expansionTileContainer(int index) {
    final hasil = ref.watch(obatNotifierProvider);
    return ExpansionTile(
      maintainState: true,
      tilePadding: const EdgeInsets.only(left: 0, right: 0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Nama Obat"),
          GestureDetector(
            onTap: () {
              ref.read(obatNotifierProvider.notifier).deleteObat(index);
            },
            child: const Icon(Icons.delete, color: Colors.red, size: 20),
          ),
        ],
      ),
      controlAffinity: ListTileControlAffinity.trailing,
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      children: [
        Text(hasil.toString()),
        autoCompleteTextField(index),
        kuantitasContainer(),
        caraPenggunaanContainer(),
        waktuPenggunaanContainer(index),
        catatanContainer(index),
      ],
    );
  }

  Widget catatanContainer(int index) {
    textController.add(TextEditingController());
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Catatan", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          TextField(
            controller: textController[index],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF38608F)),
                borderRadius: BorderRadius.circular(5.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            ),
            onChanged: (value) {
              ref
                  .read(obatNotifierProvider.notifier)
                  .updateObat(index, {'catatan': value});
            },
          ),
        ],
      ),
    );
  }

  Widget waktuPenggunaanContainer(int index) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Waktu Penggunaan", style: TextStyle(fontSize: 16)),
          Wrap(
            children: [
              waktuPenggunaanButton("Setelah Makan", 1, index),
              waktuPenggunaanButton("Sebelum Makan", 2, index),
              waktuPenggunaanButton("Sebelum Tidur", 3, index),
            ],
          ),
        ],
      ),
    );
  }

  Widget caraPenggunaanContainer() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Cara Penggunaan", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonPlusMinus(() {
                if (_kuantitasTipe > 1) {
                  setState(() {
                    _kuantitasTipe--;
                  });
                }
              }, () {
                setState(() {
                  _kuantitasTipe++;
                });
              }, _kuantitasTipe),
            ],
          ),
          Row(
            children: [
              buttonPlusMinus(() {
                if (_kuantitasWaktu > 1) {
                  setState(() {
                    _kuantitasWaktu--;
                  });
                }
              }, () {
                setState(() {
                  _kuantitasWaktu++;
                });
              }, _kuantitasWaktu),
              Expanded(
                flex: 3,
                child: PopupMenuButton<String>(
                  initialValue: _selectedTypeOf,
                  onSelected: (String? value) {
                    setState(() {
                      _selectedTypeOf = value;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    final penggunaan = [
                      'tablet',
                      'kapsul',
                      'botol',
                      'tetes',
                    ];

                    return penggunaan.map((value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList();
                  },
                  child: ListTile(
                    title: Text(_selectedTypeOf ?? ' '),
                    trailing: Image.asset("assets/icons/dropdown.png"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget kuantitasContainer() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Kuantitas", style: TextStyle(fontSize: 16)),
          Row(
            children: [
              buttonPlusMinus(() {
                if (_kuantitasObat > 1) {
                  setState(() {
                    _kuantitasObat--;
                  });
                }
              }, () {
                setState(() {
                  _kuantitasObat++;
                });
              }, _kuantitasObat),
              Expanded(
                flex: 3,
                child: PopupMenuButton<String>(
                  initialValue: _selectedType,
                  onSelected: (String? value) {
                    setState(() {
                      _selectedType = value;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    final tipe = [
                      'tablet',
                      'kapsul',
                      'botol',
                      'tetes',
                    ];

                    return tipe.map((value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList();
                  },
                  child: ListTile(
                    title: Text(_selectedType ?? ' '),
                    trailing: Image.asset("assets/icons/dropdown.png"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget autoCompleteTextField(int index) {
    return Autocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return obat['name']!.where((element) => element
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));
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
          onChanged: (value) {
            ref
                .read(obatNotifierProvider.notifier)
                .updateObat(index, {'name': value});
          },
        );
      },
    );
  }

  Widget buttonPlusMinus(Function() onTap1, Function() onTap2, value) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap1,
          child: Image.asset('assets/icons/minus.png'),
        ),
        SizedBox(
          width: 70,
          child: Text(
            value.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: onTap2,
          child: Image.asset('assets/icons/plus.png'),
        ),
      ],
    );
  }

  Widget waktuPenggunaanButton(String text, int value, int index) {
    return SizedBox(
      width: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: _selectedWaktu,
            onChanged: (value) {
              ref
                  .read(obatNotifierProvider.notifier)
                  .updateObat(index, {'waktu': text});
              _selectedWaktu = value;
            },
            activeColor: const Color(0xFF38608F),
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget bottomButtonContainer() {
    return Column(
      children: [
        const SizedBox(height: 15),
        bottomButton(
          color: Colors.white,
          textColor: const Color(0xFF38608F),
          text: "Tambah Obat",
          border: true,
          onTap: () {
            ref.read(obatNotifierProvider.notifier).addObat();
          },
        ),
        const SizedBox(height: 15),
        bottomButton(
          color: const Color(0xFF5195D6),
          textColor: Colors.white,
          text: "Simpan",
          border: false,
          onTap: () {},
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget bottomButton({
    Color? color,
    Color? textColor,
    String? text,
    bool? border,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: border!
              ? Border.all(color: const Color(0xFF38608F), width: 1.5)
              : null,
        ),
        child: Text(
          text!,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: textColor),
        ),
      ),
    );
  }
}
