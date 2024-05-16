import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/widgets.dart';
import 'package:rekam_medis_redis/data/faker/obat.dart';

class InputObatPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const InputObatPage({
    super.key,
    required this.data,
  });

  @override
  _InputObatPageState createState() => _InputObatPageState();
}

class _InputObatPageState extends State<InputObatPage> {
  String? _selectedObat;
  String? _selectedType;
  String? _selectedTypeOf;
  int _kuantitasObat = 1;
  int _kuantitasWaktu = 1;
  int _kuantitasTipe = 1;
  int? _selectedWaktu;
  String? _catatan;

  final TextEditingController _obatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Resep Obat"),
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Nama Obat",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/dropdown.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: AutoCompleteTextField<String>(
                      key: GlobalKey<AutoCompleteTextFieldState<String>>(),
                      clearOnSubmit: false,
                      suggestions: obat.map((Map<String, String> value) {
                        return value['name']!;
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFF38608F), width: 2.0),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                      ),
                      itemFilter: (item, query) {
                        return item
                            .toLowerCase()
                            .startsWith(query.toLowerCase());
                      },
                      itemSorter: (a, b) {
                        return a.compareTo(b);
                      },
                      itemSubmitted: (item) {
                        setState(() {
                          _selectedObat = item;
                          _obatController.text = item;
                        });
                      },
                      itemBuilder: (context, item) {
                        return ListTile(
                          title: Text(item),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Kuantitas", style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_kuantitasObat > 1) {
                                _kuantitasObat--;
                              }
                            });
                          },
                          child: Image.asset('assets/icons/minus.png'),
                        ),
                        Expanded(
                          child: Text(
                            _kuantitasObat.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _kuantitasObat++;
                            });
                          },
                          child: Image.asset('assets/icons/plus.png'),
                        ),
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
                              return obat.map((Map<String, String> value) {
                                return PopupMenuItem<String>(
                                  value: value['tipe'],
                                  child: Text(value['tipe']!),
                                );
                              }).toList();
                            },
                            child: ListTile(
                              title: Text(_selectedType ?? ' '),
                              trailing:
                                  Image.asset("assets/icons/dropdown.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Cara Penggunaan",
                        style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_kuantitasTipe > 1) {
                                _kuantitasTipe--;
                              }
                            });
                          },
                          child: Image.asset('assets/icons/minus.png'),
                        ),
                        Expanded(
                          child: Text(
                            _kuantitasTipe.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _kuantitasTipe++;
                            });
                          },
                          child: Image.asset('assets/icons/plus.png'),
                        ),
                        const Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text("Per Hari"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_kuantitasWaktu > 1) {
                                _kuantitasWaktu--;
                              }
                            });
                          },
                          child: Image.asset('assets/icons/minus.png'),
                        ),
                        Expanded(
                          child: Text(
                            _kuantitasWaktu.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _kuantitasWaktu++;
                            });
                          },
                          child: Image.asset('assets/icons/plus.png'),
                        ),
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
                              return obat.map((Map<String, String> value) {
                                return PopupMenuItem<String>(
                                  value: value['penggunaan'],
                                  child: Text(value['penggunaan']!),
                                );
                              }).toList();
                            },
                            child: ListTile(
                              title: Text(_selectedTypeOf ?? ' '),
                              trailing:
                                  Image.asset("assets/icons/dropdown.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Waktu Penggunaan",
                        style: TextStyle(fontSize: 16)),
                    waktuPenggunaanButton("Sebelum Makan", 1),
                    waktuPenggunaanButton("Saat Makan", 2),
                    waktuPenggunaanButton("Sesudah Makan", 3),
                    waktuPenggunaanButton("Sebelum Tidur", 4),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Catatan", style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    SizedBox(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF38608F)),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _catatan = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color(0xff5195D6), width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Tambah Obat",
                      style: TextStyle(
                        color: Color(0xff5195D6),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5195D6),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(color: Color(0xff5195D6), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget waktuPenggunaanButton(String text, int value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio(
          value: value,
          groupValue: _selectedWaktu,
          onChanged: (value) {
            setState(() {
              _selectedWaktu = value;
            });
          },
          activeColor: const Color(0xFF38608F),
        ),
        Text(text),
      ],
    );
  }
}
