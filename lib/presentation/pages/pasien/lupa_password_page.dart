import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lupa Password"),
        backgroundColor: const Color(0xFFA2C9FE),
        centerTitle: true,
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
                      buildPasswordField(
                        'Masukkan Password Baru',
                        newPasswordController,
                        _obscureTextNew,
                        (newValue) {
                          setState(() {
                            _obscureTextNew = newValue;
                          });
                        },
                      ),
                      const SizedBox(
                          height:
                              20), // Menambahkan padding antara dua text fields
                      buildPasswordField(
                        'Masukkan Ulang Password Baru',
                        confirmPasswordController,
                        _obscureTextConfirm,
                        (newValue) {
                          setState(() {
                            _obscureTextConfirm = newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 290,
                        height: 40,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (newPasswordController.text.isEmpty ||
                                confirmPasswordController.text.isEmpty) {
                              return;
                            }

                            if (newPasswordController.text !=
                                confirmPasswordController.text) {
                              return;
                            }

                            if (newPasswordController.text ==
                                    confirmPasswordController.text &&
                                newPasswordController.text.isNotEmpty &&
                                confirmPasswordController.text.isNotEmpty) {
                              _showSuccessDialog();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFFFCE186), // Background color
                            foregroundColor: Colors.black, // Text color
                            minimumSize: const Size(280, 40), // Button size
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(25), // Rounded button
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

  Widget buildPasswordField(String labelText, TextEditingController controller,
      bool obscureText, ValueChanged<bool> onObscureTextChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300, // Menjadi lebih tipis
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 280,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon:
                    Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  onObscureTextChanged(!obscureText);
                },
              ),
            ),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: 400,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 320,
              height: 180,
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.lock_person, size: 60, color: Colors.black),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PASSWORD DIPERBARUI",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Silakan masuk kembali.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 280,
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigate to login page
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFCE186),
                        foregroundColor: Colors.black,
                        minimumSize: const Size(280, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      icon: const Icon(Icons.login),
                      label: const Text(
                        'MASUK',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
