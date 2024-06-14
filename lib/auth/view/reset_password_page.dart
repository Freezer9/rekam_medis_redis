// ignore_for_file: unused_local_variable, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/constant/themes.dart';
import 'package:rekam_medis_redis/presentation/widgets/button_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/input_field.dart';
import 'package:rekam_medis_redis/presentation/widgets/snackbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final tokenController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool? isLoading;
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text("Reset Password"),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputField(
                    controller: tokenController,
                    labelText: "Token",
                    validatorMessage: "Input valid token",
                    isSubmitting: isSubmitting,
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  InputField(
                    controller: emailController,
                    labelText: "Email",
                    validatorMessage: "Input valid email",
                    isSubmitting: isSubmitting,
                    obscureText: false,
                  ),
                  const SizedBox(height: 15),
                  InputField(
                    controller: passwordController,
                    labelText: "Password",
                    validatorMessage: "Input valid password",
                    isSubmitting: isSubmitting,
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  buttonSimpan(
                    text: "Reset Password",
                    btnColor: buttonColor2,
                    textColor: Colors.white,
                    onPressed: () async {
                      final client = Supabase.instance.client;

                      if (formKey.currentState!.validate()) {
                        print("token: ${tokenController.text}");
                        isLoading = true;
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, animation,
                                  secondaryAnimation) =>
                              const Center(child: CircularProgressIndicator()),
                        );
                        try {
                          final recovery = await client.auth.verifyOTP(
                            email: emailController.text,
                            token: tokenController.text,
                            type: OtpType.recovery,
                          );

                          await client.auth.updateUser(
                            UserAttributes(password: passwordController.text),
                          );

                          isLoading = false;
                          buildSuccessSnackBar(
                              'Berhasil Ubah Password, Silahkan Login Kembali');
                          Navigator.of(context, rootNavigator: true).pop();
                        } catch (e) {
                          buildErrorSnackBar(e.toString());
                        }
                      } else {
                        buildErrorSnackBar('Isi dengan Benar!');
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
