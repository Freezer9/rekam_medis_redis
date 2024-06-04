// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/data/enums/resep.dart';
import 'package:rekam_medis_redis/domain/dokter/obat_notifier.dart';
import 'package:rekam_medis_redis/presentation/widgets/autocomplete_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/button_widget.dart';
import 'package:rekam_medis_redis/constant/themes.dart';

class InputObatDialog extends ConsumerStatefulWidget {
  int? index;
  String? obat;
  String? waktuPenggunaan;
  String? caraPenggunaan;
  String? catatan;
  int kuantitas;
  int dosis;
  int satuan;

  InputObatDialog({
    super.key,
    this.index,
    this.obat,
    this.waktuPenggunaan,
    this.caraPenggunaan,
    this.catatan = '',
    this.kuantitas = 1,
    this.dosis = 1,
    this.satuan = 1,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => InputObatDialogState();
}

class InputObatDialogState extends ConsumerState<InputObatDialog> {
  late final TextEditingController catatanController =
      TextEditingController(text: widget.catatan);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.only(bottom: 80, top: 40),
      contentPadding: EdgeInsets.zero,
      content: inputFormBox(),
      actions: [
        buttonSimpan(
          onPressed: () {
            if (widget.index != null) {
              ref.read(obatNotifierProvider.notifier).editObat(
                    index: widget.index,
                    obat: widget.obat,
                    kuantitas: widget.kuantitas.toString(),
                    penggunaan: [
                      widget.waktuPenggunaan!,
                      widget.dosis,
                      widget.satuan,
                      widget.caraPenggunaan!,
                    ],
                    catatan: widget.catatan,
                  );

              Navigator.pop(context);
              return;
            }

            if (widget.obat == null ||
                widget.waktuPenggunaan == null ||
                widget.caraPenggunaan == null ||
                widget.catatan == null) {
              return;
            }

            ref.read(obatNotifierProvider.notifier).addObat(
                  obat: widget.obat,
                  kuantitas: widget.kuantitas.toString(),
                  penggunaan: [
                    widget.waktuPenggunaan!,
                    widget.dosis,
                    widget.satuan,
                    widget.caraPenggunaan!,
                  ],
                  catatan: widget.catatan,
                );

            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget inputFormBox() {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Nama Obat",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                autoCompleteTextField(
                  data: obat,
                  onSelected: (selectedItem) {
                    widget.obat = selectedItem;
                  },
                  clearOnSubmit: false,
                  initialValue: widget.obat,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Kuantitas",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (widget.kuantitas > 1) {
                          setState(() {
                            widget.kuantitas--;
                          });
                        }
                      },
                      child: Image.asset('assets/icons/minus.png'),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      widget.kuantitas.toString(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.kuantitas++;
                        });
                      },
                      child: Image.asset('assets/icons/plus.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Cara Penggunaan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (widget.dosis > 1) {
                              setState(() {
                                widget.dosis--;
                              });
                            }
                          },
                          child: Image.asset('assets/icons/minus.png'),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          widget.dosis.toString(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.dosis++;
                            });
                          },
                          child: Image.asset('assets/icons/plus.png'),
                        ),
                      ],
                    ),
                    const Text(
                      "Per hari",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (widget.satuan > 1) {
                          setState(() {
                            widget.satuan--;
                          });
                        }
                      },
                      child: Image.asset('assets/icons/minus.png'),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      widget.satuan.toString(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.satuan++;
                        });
                      },
                      child: Image.asset('assets/icons/plus.png'),
                    ),
                    const SizedBox(width: 20),
                    DropdownButton(
                      items: caraPenggunaan
                          .map((value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          widget.caraPenggunaan = value;
                        });
                      },
                      value: widget.caraPenggunaan,
                    ),
                    const SizedBox(width: 20),
                    const Text("Sekali", style: TextStyle(fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Waktu Penggunaan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                DropdownMenu(
                  initialSelection: widget.waktuPenggunaan,
                  inputDecorationTheme: const InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  ),
                  dropdownMenuEntries: waktuPenggunaan
                      .map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  }).toList(),
                  onSelected: (value) {
                    widget.waktuPenggunaan = value!;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Catatan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                customTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextField() {
    return TextField(
      controller: catatanController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: primarycolor, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      ),
      onSubmitted: (value) {
        widget.catatan = value;
      },
    );
  }
}
