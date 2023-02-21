import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:trybu/core/ui/styles/app_colors.dart';
import 'package:trybu/core/ui/styles/app_style.dart';
import 'package:trybu/pages/sign_in/components/social_button_tile.dart';
import 'package:trybu/stores/sign_in/sign_in_store.dart';
import 'package:trybu/widgets/buttons/custom_text_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/ui/styles/app_icons.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _cEmail = TextEditingController();
  final _cPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final signInStore = SignInStore();
  FocusScopeNode currentFocus = FocusScopeNode();
  bool isLoading = false;

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _cEmail.text.trim(), password: _cPassword.text.trim());
  }

  @override
  void dispose() {
    _cEmail.dispose();
    _cPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/images/logoTr.png',
                      width: 67,
                      height: 67,
                      color: AppColors.brownColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (_) {
                      return TextFormField(
                          controller: _cEmail,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: signInStore.setEmail,
                          decoration: AppStyle.inputDecorationStyle.copyWith(
                            hintText: 'E-mail',
                            suffixIcon: IconButton(
                              onPressed: signInStore.togglePassword,
                              icon: const Icon(Icons.email_outlined),
                            ),
                          ),
                          validator: signInStore.validateEmail);
                    }),
                    const SizedBox(height: 10),
                    Observer(builder: (_) {
                      return TextFormField(
                        controller: _cPassword,
                        onChanged: signInStore.setPassword,
                        validator: signInStore.validatePassword,
                        obscureText: !signInStore.passwordVisible,
                        decoration: AppStyle.inputDecorationStyle.copyWith(
                          hintText: 'Palavra-passe',
                          suffixIcon: IconButton(
                            onPressed: signInStore.togglePassword,
                            icon: Icon(
                              !signInStore.passwordVisible
                                  ? Icons.lock_outline_rounded
                                  : Icons.lock_open_outlined,
                            ),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomizeTextButton(
                        text: 'Esqueceu a senha?',
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        child: const Text('Entrar'),
                        onPressed: () {
                          final valid = _formKey.currentState!.validate();
                          if (valid) {
                            signInStore.loading;
                            currentFocus.hasPrimaryFocus
                                ? currentFocus.unfocus()
                                : null;

                            signIn();
                            Navigator.pushReplacementNamed(context, 'homePage');
                            print('logou');
                          } else {
                            setState(() {
                              !signInStore.loading;
                            });
                            _cPassword.clear();
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text(' Ou continue com '),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SocialButtonTile(
                          imagePath: AppIcons.google,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SocialButtonTile(
                          imagePath: AppIcons.apple,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
