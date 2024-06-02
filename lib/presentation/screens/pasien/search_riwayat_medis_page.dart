// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/domain/pasien/riwayat_provider.dart';
import 'package:rekam_medis_redis/presentation/widgets/pasien_record_card.dart';

class SearchRiwayatMedisPage extends ConsumerStatefulWidget {
  SearchRiwayatMedisPage({super.key});

  @override
  ConsumerState<SearchRiwayatMedisPage> createState() =>
      _SearchRiwayatMedisPageState();
}

class _SearchRiwayatMedisPageState
    extends ConsumerState<SearchRiwayatMedisPage> {
  final TextEditingController _textEditingController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authUserProvider).asData?.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFA2C9FE),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              focusNode: AlwaysDisabledFocusNode(),
                              controller: _textEditingController,
                              onTap: () {
                                _selectDate(context);
                              },
                              decoration: const InputDecoration(
                                hintText: 'DD/MM/YYYY',
                                suffixIcon: Icon(Icons.calendar_today,
                                    color: Color(0xff38608F)),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 11),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFCE186),
                            textStyle: const TextStyle(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text('Cari'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            bottom: 0,
            left: 0,
            right: 0,
            child: ValueListenableBuilder<List<Map<String, String>>>(
              valueListenable: ValueNotifier<List<Map<String, String>>>([]),
              builder: (context, data, child) {
                return Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(top: 20),
                        color: Colors.transparent,
                        child: ref
                            .watch(getPasienRecordProvider(
                                id: user!.id, date: _selectedDate))
                            .when(
                          data: (data) {
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                final record = data[index];
                                return GestureDetector(
                                  onTap: () {
                                    context.push('/detail-pasien',
                                        extra: record["record"]);
                                  },
                                  child: PasienRecordCard(
                                      dokter: record["dokter"],
                                      data: record["record"],
                                      user: user),
                                );
                              },
                            );
                          },
                          error: (error, stackTrace) {
                            return Center(
                              child: Text(
                                'Error: $error',
                                style: const TextStyle(fontSize: 20),
                              ),
                            );
                          },
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMd().format(_selectedDate!)
        ..selection = TextSelection.fromPosition(
          TextPosition(
              offset: _textEditingController.text.length,
              affinity: TextAffinity.upstream),
        );
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
