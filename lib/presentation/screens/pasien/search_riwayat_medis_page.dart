import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/domain/pasien/riwayat_provider.dart';
import 'package:rekam_medis_redis/presentation/widgets/pasien_record_card.dart';

class SearchRiwayatMedisPage extends ConsumerWidget {
  const SearchRiwayatMedisPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            // onTap: () => _selectDate(context),
                            child: AbsorbPointer(
                              child: ValueListenableBuilder<DateTime?>(
                                valueListenable: ValueNotifier<DateTime?>(null),
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
                          onPressed: () {
                            print('Cari');
                          },
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
                        child:
                            ref.watch(getPasienRecordProvider(user!.id)).when(
                          data: (data) {
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                final record = data[index];
                                return GestureDetector(
                                  onTap: () {
                                    context.push('/detail-pasien',
                                        extra: data[index]);
                                  },
                                  child: PasienRecordCard(
                                      dokter: record["dokter"],
                                      data: record["record"],
                                      user: user),
                                  // child: PasienCard(data: data[index]),
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
}
