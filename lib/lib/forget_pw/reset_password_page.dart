import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_app_bar/backround_image.dart';
import 'package:flutter_application_1/custom_app_bar/custom_app_bar.dart';
import 'package:flutter_application_1/custom_app_bar/custom_app_bar_with_back.dart';
import 'package:flutter_application_1/forget_pw/password_file.dart';
import 'package:flutter_application_1/forget_pw/success_dialog.dart';
import 'password_validation.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscureTextNew = true;
  bool _obscureTextConfirm = true;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBarBack(
        title: "Lupa Password",
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
                Container(
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Color(0xffC3C6CF)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 0.1,
                        blurRadius: 1,
                        color: Color(0xFF38608F),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Text(
                        "Atur Ulang Password-mu",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      PasswordField(
                        labelText: 'Masukkan Password Baru',
                        controller: newPasswordController,
                        obscureText: _obscureTextNew,
                        onObscureTextChanged: (newValue) {
                          setState(() {
                            _obscureTextNew = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      PasswordField(
                        labelText: 'Masukkan Ulang Password Baru',
                        controller: confirmPasswordController,
                        obscureText: _obscureTextConfirm,
                        onObscureTextChanged: (newValue) {
                          setState(() {
                            _obscureTextConfirm = newValue;
                          });
                        },
                        errorMessage: _errorMessage,
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: 290,
                        height: 40,
                        child: ElevatedButton.icon(
                          onPressed: _validateAndSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFFCE186), // Background color
                            foregroundColor: Colors.black, // Text color
                            minimumSize: Size(280, 40), // Button size
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(25), // Rounded button
                            ),
                          ),
                          icon: Icon(Icons.lock_reset),
                          label: Text(
                            'PERBARUI PASSWORD',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                      border: Border.all(width: 2),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 1,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2024/01/25/03/16/capuchin-monkey-8530884_640.jpg',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Icon(Icons.lock,
                      color: Color.fromARGB(255, 89, 57, 137), size: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validateAndSubmit() {
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    setState(() {
      _errorMessage = validatePassword(newPassword, confirmPassword);
    });

    if (_errorMessage == null) {
      SuccessDialog();
    }
  }
}
