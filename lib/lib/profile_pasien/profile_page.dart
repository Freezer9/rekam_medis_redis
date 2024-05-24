import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_app_bar/backround_image.dart';
import 'package:flutter_application_1/custom_app_bar/custom_app_bar_with_back.dart';
import 'package:flutter_application_1/forget_pw/reset_password_page.dart';
import 'package:flutter_application_1/profile_pasien/profile_info.dart';

class ProfilePasienView extends StatelessWidget {
  const ProfilePasienView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBack(
        title: "Profile",
        leadingOnPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                BackgroundImage(),
                _buildProfileInfo(context),
                SizedBox(height: 30),
                _buildResetPasswordButton(context),
                SizedBox(height: 10),
                _buildLogoutButton(),
                SizedBox(height: 20),
              ],
            ),
            Positioned(
              top: 20,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 5),
                      color: Colors.white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2024/01/25/03/16/capuchin-monkey-8530884_640.jpg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResetPasswordButton(BuildContext context) {
    return Container(
      width: 340,
      height: 40,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordPage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          minimumSize: Size(280, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          side: BorderSide(color: Colors.black),
        ),
        icon: Icon(Icons.lock_reset),
        label: Text(
          'LUPA PASSWORD',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      width: 340,
      height: 40,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFB5F5F),
          foregroundColor: Colors.white,
          minimumSize: Size(280, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        icon: Icon(Icons.logout),
        label: Text(
          'KELUAR',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.9, // Menggunakan MediaQuery untuk mendapatkan width
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Color(0xffC3C6CF)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.2,
            blurRadius: 2,
            color: Color(0xFF38608F),
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 20.0, bottom: 20, left: 25, right: 25),
      child: ProfileInfo(),
    );
  }
}
