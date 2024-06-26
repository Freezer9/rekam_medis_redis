// ignore_for_file: prefer_final_fields, unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/constant/themes.dart';
import 'package:rekam_medis_redis/core/utils.dart';
import 'package:rekam_medis_redis/data/enums/role.dart';
import 'package:rekam_medis_redis/presentation/widgets/input_field.dart';
import 'package:rekam_medis_redis/presentation/widgets/snackbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends ConsumerStatefulWidget {
  final Role role;
  const LoginPage({super.key, required this.role});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode? _autovalidateMode;
  bool _isSubmitting = false;

  final _passwordCtrl = TextEditingController();
  final _usernameCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 35, right: 35, top: 50),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Image.asset(widget.role.asset),
                  ),
                  Text(
                    "Login ${widget.role.label}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    controller: _usernameCtrl,
                    labelText: 'Username',
                    validatorMessage: 'Please enter your username',
                    isSubmitting: _isSubmitting,
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),
                  InputField(
                      controller: _passwordCtrl,
                      labelText: 'Password',
                      validatorMessage: 'Please enter your password',
                      isSubmitting: _isSubmitting,
                      obscureText: true),
                  const SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xFF5195D6),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 80,
                      ),
                    ),
                    onPressed: _isSubmitting
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              _checkSignIn(widget.role);
                            } else {
                              setState(() {
                                _autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => context.push('/send-token'),
                    child: const Text(
                      "Lupa Password?",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            color: primarycolor,
                            offset: Offset(0, -5),
                          )
                        ],
                        color: Colors.transparent,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
                        decorationColor: primarycolor,
                      ),
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

  void _checkSignIn(Role role) {
    if (role == Role.admin) {
      _signIn(
          loginMethod: ref
              .read(authRepositoryProvider)
              .signInAdmin(
                  email: _usernameCtrl.text, password: _passwordCtrl.text)
              .then((_) {
        context.clearAndNavigate('/home/${role.index}');
      }));
    } else if (role == Role.dokter) {
      _signIn(
          loginMethod: ref
              .read(authRepositoryProvider)
              .signInDokter(
                  email: _usernameCtrl.text, password: _passwordCtrl.text)
              .then((_) {
        context.clearAndNavigate('/home/${role.index}');
      }));
    } else {
      _signIn(
          loginMethod: ref
              .read(authRepositoryProvider)
              .signInPasien(
                  username: _usernameCtrl.text, password: _passwordCtrl.text)
              .then((_) {
        context.clearAndNavigate('/home/${role.index}');
      }));
    }
  }

  void _signIn({Future? loginMethod}) async {
    try {
      await loginMethod;
    } catch (error) {
      if (error is AuthApiException) {
        ScaffoldMessenger.of(context)
            .showSnackBar(buildErrorSnackBar(error.message));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            buildErrorSnackBar('Terjadi kesalahan, silahkan coba lagi'));
      }
    }
  }
}
