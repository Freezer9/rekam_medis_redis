// ignore_for_file: prefer_final_fields, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rekam_medis_redis/auth/auth.dart';
import 'package:rekam_medis_redis/data/enums/role.dart';
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
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
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
                  inputLogin(
                      _usernameCtrl, 'Username', 'Please enter your username'),
                  const SizedBox(height: 20),
                  inputLogin(
                      _passwordCtrl, 'Password', 'Please enter your password',
                      obscureText: true),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: TextButton(
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
                                _signIn(widget.role);
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField inputLogin(TextEditingController controller, String labelText,
      String validatorMessage,
      {bool obscureText = false}) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      readOnly: _isSubmitting,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorMessage;
        }

        return null;
      },
    );
  }

  void _signIn(Role role) async {
    if (role.index == 0) {
      _signInAdmin();
    } else if (role.index == 1) {
      _signInPasien();
    } else if (role.index == 2) {
      _signInDokter();
    }
  }

  void _signInAdmin() {
    ref
        .read(authRepositoryProvider)
        .signInAdmin(email: _usernameCtrl.text, password: _passwordCtrl.text)
        .then((value) {
      context.push(
        '/home/${widget.role.index}',
      );
    }).catchError((error) {
      if (error is AuthApiException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
          ),
        );
      }
    });
  }

  void _signInPasien() {
    ref
        .read(authRepositoryProvider)
        .signInPasien(
            username: _usernameCtrl.text, password: _passwordCtrl.text)
        .then((value) {
      context.push(
        '/home/${widget.role.index}',
      );
    }).catchError((error) {
      if (error is AuthApiException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
          ),
        );
      }
    });
  }

  void _signInDokter() {
    ref
        .read(authRepositoryProvider)
        .signInDokter(email: _usernameCtrl.text, password: _passwordCtrl.text)
        .then((value) {
      context.push('/home/${widget.role.index}');
    }).catchError((error) {
      if (error is AuthApiException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
          ),
        );
      }
    });
  }
}
