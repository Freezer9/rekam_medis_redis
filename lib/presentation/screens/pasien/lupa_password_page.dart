import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/domain/pasien/password_validation.dart';
import 'package:rekam_medis_redis/presentation/widgets/password_field.dart';
import 'package:rekam_medis_redis/presentation/widgets/success_dialog.dart';

class LupaPasswordPage extends ConsumerStatefulWidget {
  const LupaPasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LupaPasswordPageState();
}

class _LupaPasswordPageState extends ConsumerState<LupaPasswordPage> {
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
      appBar: AppBar(
        title: const Text("Lupa Password"),
        backgroundColor: const Color(0xFFA2C9FE),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/background.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 1.0, color: const Color(0xffC3C6CF)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0.2,
                        blurRadius: 2,
                        color: Color(0xFF38608F),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      const Text(
                        "Atur Ulang Password-mu",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 290,
                        height: 40,
                        child: ElevatedButton.icon(
                          onPressed: _validateAndSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFCE186),
                            foregroundColor: Colors.black,
                            minimumSize: const Size(280, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          icon: const Icon(Icons.lock_reset),
                          label: const Text(
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
                      image: const DecorationImage(
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
                  const Icon(Icons.lock,
                      color: Color.fromARGB(255, 89, 57, 137), size: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SuccessDialog();
      },
    );
  }

  void _validateAndSubmit() async {
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    setState(() {
      _errorMessage = validatePassword(newPassword, confirmPassword);
    });

    if (_errorMessage == null) {
      await ref.read(authRepositoryProvider).changePassword(newPassword);
      _showSuccessDialog();
    }
  }
}
