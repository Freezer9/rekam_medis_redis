import 'package:flutter/material.dart';
import 'package:rekam_medis_redis/constant/themes.dart';
import 'package:rekam_medis_redis/presentation/widgets/button_widget.dart';
import 'package:rekam_medis_redis/presentation/widgets/input_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final tokenController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final isSubmitting = false;

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
                  onPressed: () {
                    print("Reset Password");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
