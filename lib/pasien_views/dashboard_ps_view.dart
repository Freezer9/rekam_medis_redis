import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/datafake/user.dart';
import 'package:rekam_medis_redis/pasien_views/profile_page.dart'; // Import file yang berisi data usersData
// import 'package:rekam_medis_redis/riwayat_rekam_medis.dart'; // Import file RiwayatRekamMedis

class DasboardPasienView extends StatelessWidget {
  const DasboardPasienView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              margin: const EdgeInsets.only(top: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello User',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'How Was ur day?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Implementasi untuk menavigasi ke halaman profil
                        },
                        child: Image.network(
                          'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(230, 234, 242, 1),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari riwayat rekam medis terbaru',
                        border: InputBorder.none,
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 12),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Rekam Medis Terbaru...',
                  style: TextStyle(
                    color: Color.fromARGB(255, 210, 228, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: usersData.length,
                itemBuilder: (BuildContext context, int index) {
                  final userData = usersData[index];
                  return _buildPasienCard(
                    userData['dr_name']!,
                    userData['date']!,
                    userData['diagnosa']!,
                  );
                },
              ),
            ),
            SizedBox(height: 20), // Penambahan jarak antara riwayat medis dan artikel
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      'Artikel...',
                      style: TextStyle(
                        color: Color.fromARGB(255, 210, 228, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePasienView(),
                          ),
                        );
                      },
                      child: Text(
                        'Selengkapnya..',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Coming Soon',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasienCard(String drName, String date, String diagnosa) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
          ),
        ],
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(210, 228, 255, 1),
          width: 1,
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                    'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/man-user-circle-icon.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  date,
                  style: TextStyle(
                    color: Color.fromRGBO(25, 28, 32, 1),
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'Oleh',
                      style: TextStyle(
                        color: Color.fromRGBO(67, 71, 78, 1),
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 38), // Penambahan jarak antara teks "Oleh" dan ":"
                    Text(
                      ':',
                      style: TextStyle(
                        color: Color.fromRGBO(67, 71, 78, 1),
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 10), // Penambahan jarak antara teks ":" dan "$drName"
                    Text(
                      drName,
                      style: TextStyle(
                        color: Color.fromRGBO(67, 71, 78, 1),
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Diagnosa',
                      style: TextStyle(
                        color: Color.fromRGBO(67, 71, 78, 1),
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 10), // Penambahan jarak antara teks "Diagnosa" dan ":"
                    Text(
                      ':',
                      style: TextStyle(
                        color: Color.fromRGBO(67, 71, 78, 1),
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 10), // Penambahan jarak antara teks ":" dan "$diagnosa"
                    Text(
                      diagnosa,
                      style: TextStyle(
                        color: Color.fromRGBO(67, 71, 78, 1),
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
