import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Contact {
  final int id;
  final String name;

  Contact(this.id, this.name);

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class DataPasien extends StatefulWidget {
  const DataPasien({super.key});

  @override
  State<DataPasien> createState() => _DataPasienState();
}

class _DataPasienState extends State<DataPasien> {
  final List<Contact> _contacts = [
    Contact(1, "Panas"),
    Contact(2, "Panas banget"),
    Contact(3, "Donald Glover"),
    Contact(4, "Gillian Jacobs"),
    Contact(5, "Alison Brie"),
    Contact(6, "Chevy Chase"),
    Contact(7, "Jim Rash"),
    Contact(8, "Yvette Nicole Brown"),
    Contact(9, "Jeff Winger"),
    Contact(10, "Abed Nadir"),
    Contact(11, "Troy Barnes"),
    Contact(12, "Britta Perry"),
    Contact(13, "Annie Edison"),
  ];

  List<Contact> _searchResultKeluhan = [];
  List<Contact> _searchResultRiwayat = [];
  List<Contact> _searchResultDiagnosis = [];

  final List<String> _searchHistoryKeluhan = [];
  final List<String> _searchHistoryRiwayat = [];
  final List<String> _searchHistoryDiagnosis = [];
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchResultKeluhan = _contacts;
    _searchResultRiwayat = _contacts;
    _searchResultDiagnosis = _contacts;
  }

  void _addToHistory(String query, List<String> historyList) {
    setState(() {
      if (!historyList.contains(query)) {
        historyList.insert(0, query);
      }
    });
  }

  void _onSearchSubmittedKeluhan(String query) {
    setState(() {
      _searchText = query;
      _searchResultKeluhan = _contacts
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _addToHistory(query, _searchHistoryKeluhan);
    });
  }

  void _onSearchSubmittedRiwayat(String query) {
    setState(() {
      _searchText = query;
      _searchResultRiwayat = _contacts
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _addToHistory(query, _searchHistoryRiwayat);
    });
  }

  void _onSearchSubmittedDiagnosis(String query) {
    setState(() {
      _searchText = query;
      _searchResultDiagnosis = _contacts
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _addToHistory(query, _searchHistoryDiagnosis);
    });
  }

  void _onContactSelectedKeluhan(Contact contact) {
    setState(() {
      _searchText = contact.name;
      _searchResultKeluhan = _contacts
          .where(
              (c) => c.name.toLowerCase().contains(contact.name.toLowerCase()))
          .toList();
      _addToHistory(contact.name, _searchHistoryKeluhan);
    });
  }

  void _onContactSelectedRiwayat(Contact contact) {
    setState(() {
      _searchText = contact.name;
      _searchResultRiwayat = _contacts
          .where(
              (c) => c.name.toLowerCase().contains(contact.name.toLowerCase()))
          .toList();
      _addToHistory(contact.name, _searchHistoryRiwayat);
    });
  }

  void _onContactSelectedDiagnosis(Contact contact) {
    setState(() {
      _searchText = contact.name;
      _searchResultDiagnosis = _contacts
          .where(
              (c) => c.name.toLowerCase().contains(contact.name.toLowerCase()))
          .toList();
      _addToHistory(contact.name, _searchHistoryDiagnosis);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Input Data Pasien'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF6FAFE),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Keluhan Pasien',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Autocomplete<Contact>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<Contact>.empty();
                      }
                      return _contacts.where((Contact contact) {
                        return contact.name
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    displayStringForOption: (Contact option) => option.name,
                    onSelected: (Contact selection) {
                      _onContactSelectedKeluhan(selection);
                      
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
                          _onSearchSubmittedKeluhan(value);
                          onFieldSubmitted();
                          textEditingController.clear();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            if (_searchHistoryKeluhan.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Riwayat Keluhan:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      children: _searchHistoryKeluhan.map((query) {
                        return Chip(
                          label: Text(query),
                          onDeleted: () {
                            setState(() {
                              _searchHistoryKeluhan.remove(query);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Riwayat Penyakit',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Autocomplete<Contact>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<Contact>.empty();
                      }
                      return _contacts.where((Contact contact) {
                        return contact.name
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    displayStringForOption: (Contact option) => option.name,
                    onSelected: (Contact selection) {
                      _onContactSelectedRiwayat(selection);
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        onSubmitted: (value) {
                          _onSearchSubmittedRiwayat(value);
                          onFieldSubmitted();
                          textEditingController.clear();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            if (_searchHistoryRiwayat.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Riwayat Penyakit:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      children: _searchHistoryRiwayat.map((query) {
                        return Chip(
                          label: Text(query),
                          onDeleted: () {
                            setState(() {
                              _searchHistoryRiwayat.remove(query);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Diagnosis',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Autocomplete<Contact>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable<Contact>.empty();
                      }
                      return _contacts.where((Contact contact) {
                        return contact.name
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    displayStringForOption: (Contact option) => option.name,
                    onSelected: (Contact selection) {
                      _onContactSelectedDiagnosis(selection);
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        onSubmitted: (value) {
                          _onSearchSubmittedDiagnosis(value);
                          onFieldSubmitted();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            if (_searchHistoryDiagnosis.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Riwayat Diagnosis:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8.0,
                      children: _searchHistoryDiagnosis.map((query) {
                        return Chip(
                          label: Text(query),
                          onDeleted: () {
                            setState(() {
                              _searchHistoryDiagnosis.remove(query);
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resep Obat',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                      height: 8), // Menambahkan jarak antara teks dan tombol
                  TextButton(
                    onPressed: () {
                      // Fungsi yang akan dijalankan ketika tombol ditekan
                    },
                    child: const Text(
                      '+ Tambahkan Resep',
                      style: TextStyle(
                        color: Colors.blue, // Mengatur warna teks menjadi biru
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 90, 154, 250),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text(
            'Simpan',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
