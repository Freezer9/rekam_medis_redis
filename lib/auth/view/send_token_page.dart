import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/constant/themes.dart';
import 'package:rekam_medis_redis/presentation/widgets/button_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/input_field.dart';

class SendTokenPage extends StatefulWidget {
  const SendTokenPage({super.key});

  @override
  State<SendTokenPage> createState() => _SendTokenPageState();
}

class _SendTokenPageState extends State<SendTokenPage> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode? autoValidateMode;
  final controller = TextEditingController();
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("Send Token"),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.password_outlined, size: 30),
                  const SizedBox(height: 20),
                  InputField(
                    controller: controller,
                    labelText: "Email",
                    validatorMessage: "Please input your email",
                    isSubmitting: isSubmitting,
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  buttonSimpan(
                      text: "Kirim Token",
                      btnColor: buttonColor2,
                      textColor: Colors.white,
                      onPressed: isSubmitting
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                print("Kirim Token");
                              } else {
                                setState(() {
                                  autoValidateMode = AutovalidateMode.always;
                                });
                              }
                            }),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      context.push('/reset-password');
                    },
                    child: const Text(
                      "Sudah Punya Token? Reset Password Anda",
                      style: TextStyle(color: primarycolor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
