import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/datafake/keluhan.dart';
import 'package:rekam_medis_redis/widget/custom_autocomplete.dart';
import 'package:rekam_medis_redis/widget/konten.dart';

class DataPasienPage extends StatefulWidget {
  const DataPasienPage({super.key});

  @override
  State<DataPasienPage> createState() => _DataPasienPageState();
}

class _DataPasienPageState extends State<DataPasienPage> {
  String _searchText = '';
  final List<String> _searchHistory = [];
  List<Keluhan> _searchResult = [];

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
          children: [
            Konten(
              text: 'Keluhan Pasien',
              isiKonten: CustomAutoComplete(
                  search: _searchHistory,
                  onSelected: _onSelected,
                  onSubmitted: _onSubmitted),
            ),
            Konten(
              text: 'Riwayat Penyakit',
              isiKonten: CustomAutoComplete(
                  search: _searchHistory,
                  onSelected: _onSelected,
                  onSubmitted: _onSubmitted),
            ),
            Konten(
              text: 'Diagnosis',
              isiKonten: CustomAutoComplete(
                  search: _searchHistory,
                  onSelected: _onSelected,
                  onSubmitted: _onSubmitted),
            ),
            ElevatedButton(
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
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToHistory(String query, List<String> historyList) {
    setState(() {
      if (!historyList.contains(query)) {
        historyList.insert(0, query);
      }
    });
  }

  //TODO: class Keluhan nnti diganti jadi keluhan, riwayat pasien, dan diagnosis
  void _onSelected(Keluhan keluhan) {
    setState(() {
      _searchText = keluhan.name;
      _searchResult = Keluhan.where(
              (c) => c.name.toLowerCase().contains(keluhan.name.toLowerCase()))
          .toList();
      _addToHistory(keluhan.name, _searchHistory);
    });
  }

  void _onSubmitted(String query) {
    setState(() {
      _searchText = query;
      _searchResult = Keluhan.where((keluhan) =>
          keluhan.name.toLowerCase().contains(query.toLowerCase())).toList();
      _addToHistory(query, _searchHistory);
    });
  }
}
