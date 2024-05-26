import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rekam_medis_redis/data/faker/pasien.dart';
import 'package:rekam_medis_redis/presentation/widgets/patients_widget.dart';

class RiwayatRekamMedisPage extends StatefulWidget {
  const RiwayatRekamMedisPage({super.key});

  @override
  _RiwayatRekamMedisPageState createState() => _RiwayatRekamMedisPageState();
}

class _RiwayatRekamMedisPageState extends State<RiwayatRekamMedisPage> {
  final ValueNotifier<DateTime?> selectedDate = ValueNotifier<DateTime?>(null);
  final ValueNotifier<List<Map<String, String>>> filteredData =
      ValueNotifier<List<Map<String, String>>>(patientsData);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  void _filterDataByDate() {
    if (selectedDate.value != null) {
      String formattedDate =
          DateFormat('dd/MM/yyyy').format(selectedDate.value!);
      filteredData.value = patientsData.where((patient) {
        return patient['date'] == formattedDate;
      }).toList();
    } else {
      filteredData.value = patientsData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context),
                            child: AbsorbPointer(
                              child: ValueListenableBuilder<DateTime?>(
                                valueListenable: selectedDate,
                                builder: (context, value, child) {
                                  return Container(
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
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'DD/MM/YYYY',
                                        suffixIcon: Icon(Icons.calendar_today,
                                            color: Color(0xff38608F)),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 15),
                                      ),
                                      controller: TextEditingController(
                                        text: value == null
                                            ? ''
                                            : DateFormat('dd/MM/yyyy')
                                                .format(value),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFCE186),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                          ),
                          onPressed: _filterDataByDate,
                          child: const Text(
                            'Cari',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            bottom: 0,
            left: 0,
            right: 0,
            child: ValueListenableBuilder<List<Map<String, String>>>(
              valueListenable: filteredData,
              builder: (context, data, child) {
                return Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(top: 20),
                        color: Colors.transparent,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return PasienCard(data: data[index]);
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
}
