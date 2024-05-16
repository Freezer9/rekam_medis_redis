import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lupa Password"),
        backgroundColor: Color(0xFFA2C9FE),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/background.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: width * 0.9,
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
                      SizedBox(
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
                      SizedBox(height: 40),
                      Container(
                        width: 290,
                        height: 40,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Assume password reset logic here is successful
                            _showSuccessDialog();
                          },
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

  Widget buildPasswordField(String labelText, TextEditingController controller,
      bool obscureText, ValueChanged<bool> onObscureTextChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300, // Menjadi lebih tipis
            fontSize: 14,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 280,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFF3F3F3),
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
                  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon:
                    Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  onObscureTextChanged(!obscureText);
                },
              ),
            ),
            style: TextStyle(
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
        return Container(
          width: 400,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 320,
              height: 180,
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Container(
                    width: 320,
                    height: 10,
                    child: Image.asset(
                      "assets/background.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
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
                  SizedBox(height: 20),
                  Container(
                    width: 280,
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigate to login page
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFCE186),
                        foregroundColor: Colors.black,
                        minimumSize: Size(280, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      icon: Icon(Icons.login),
                      label: Text(
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
