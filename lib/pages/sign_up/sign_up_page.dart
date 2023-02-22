import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';
import 'package:trybu/core/ui/styles/app_style.dart';
import 'package:trybu/core/ui/styles/app_typography.dart';

import '../../stores/sign_up/sign_up_store.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _cName = TextEditingController();
  final _cEmail = TextEditingController();
  final _cNumberPhone = TextEditingController();
  final _cPassword = TextEditingController();
  final _cConfirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final signUpStore = SignUpStore();
  final currentFocus = FocusScopeNode();

  @override
  void dispose() {
    _cName.dispose();
    _cNumberPhone.dispose();
    _cConfirmPassword.dispose();
    _cEmail.dispose();
    _cPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
            child: Observer(
              builder: (_) {
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Text(
                          'Registrar',
                          style: AppTypography.bodyTextBold(context)!
                              .copyWith(fontSize: 20),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: AppStyle.inputDecorationStyle.copyWith(
                          hintText: 'Nome',
                          suffixIcon: const Icon(Icons.person_outline_rounded),
                        ),
                        controller: _cName,
                        validator: signUpStore.validateName,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _cEmail,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: signUpStore.setEmail,
                        decoration: AppStyle.inputDecorationStyle.copyWith(
                          suffixIcon: const Icon(Icons.email_outlined),
                          hintText: 'E-mail',
                        ),
                        validator: signUpStore.validateEmail,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: signUpStore.setPhoneNumber,
                        keyboardType: TextInputType.number,
                        controller: _cNumberPhone,
                        maxLength: 9,
                        decoration: AppStyle.inputDecorationStyle.copyWith(
                          hintText: 'Informe o seu telefone',
                          counterText: '',
                          suffixIcon: const Icon(Icons.phone),
                        ),
                        validator: signUpStore.validatePhoneNumber,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _cPassword,
                        obscureText: !signUpStore.passWordVisible,
                        onChanged: signUpStore.setPassword,
                        decoration: AppStyle.inputDecorationStyle.copyWith(
                          hintText:
                              'Informe uma senha com 6 caracteres ou superior',
                          suffixIcon: IconButton(
                            onPressed: signUpStore.togglePasswordVisible,
                            icon: Icon(
                              !signUpStore.passWordVisible
                                  ? Icons.lock_outline_rounded
                                  : Icons.lock_open_outlined,
                            ),
                          ),
                        ),
                        validator: signUpStore.validatePassword,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        onChanged: signUpStore.setConfirmPassword,
                        decoration: AppStyle.inputDecorationStyle.copyWith(
                          hintText: 'Confirme a sua senha',
                          suffixIcon: IconButton(
                            onPressed: signUpStore.toggleConfirmPassword,
                            icon: Icon(
                              !signUpStore.confirmPasswordVisible
                                  ? Icons.lock_outline_rounded
                                  : Icons.lock_open_outlined,
                            ),
                          ),
                        ),
                        controller: _cConfirmPassword,
                        validator: signUpStore.validateConfirmPassword,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            child: const Text('Registar conta'),
                            onPressed: () async {
                              final valid = _formKey.currentState!.validate();
                              if (valid) {
                                signUpStore.isLoading;
                                currentFocus.hasPrimaryFocus
                                    ? currentFocus.unfocus()
                                    : null;
                                showDialog(
                                    context: context,
                                    builder: (_) => const Center(
                                          child: CircularProgressIndicator(
                                            color: AppColors.brownColor,
                                          ),
                                        ),);
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _cEmail.text.trim(),
                                        password: _cPassword.text.trim());
                                Navigator.of(context).pop();
                                Navigator.pushNamed(context, 'homePage');
                              } else {
                                !signUpStore.loading;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: AppColors.red,
                                    content: Text(
                                      'Ocorreu um erro ao fazer registro',
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                  ),
                                );
                              }
                            }),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Já tem conta?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'signInPage');
                            },
                            child: const Text('Entrar'),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
