import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trybu/core/helpers/size_extension.dart';

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
      backgroundColor: Color.fromARGB(255, 226, 226, 226),
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: context.screenWidth,
                  height: context.screenHeight,
                  color: Color.fromARGB(255, 226, 226, 226),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0, right: 12),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            AppIcons.appLogo,
                            width: 120,
                            height: 120,
                            color: AppColors.brownColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: context.screenWidth,
                  height: context.screenHeight,
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Observer(builder: (_) {
                          return TextFormField(
                              controller: _cEmail,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: signInStore.setEmail,
                              decoration:
                                  AppStyle.inputDecorationStyle.copyWith(
                                hintText: 'E-mail',
                                suffixIcon: Icon(Icons.email_outlined),
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
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
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
                            onPressed: () async {
                              final valid = _formKey.currentState!.validate();
                              if (valid) {
                                signInStore.loading;
                                currentFocus.hasPrimaryFocus
                                    ? currentFocus.unfocus()
                                    : null;
                                showDialog(
                                  context: context,
                                  builder: (_) => const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.brownColor,
                                    ),
                                  ),
                                );
                                 await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _cEmail.text.trim(), password: _cPassword.text.trim());
                                Navigator.pushReplacementNamed(
                                    context, 'homePage');
                                print('logou');
                              } else {
                                _cPassword.clear();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: AppColors.red,
                                    content: Text(
                                      'Ocorreu um erro ao efectuar login',
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                  ),
                                );
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
                                  color: AppColors.textFieldBorder),
                            ),
                            Text(' Ou continue com '),
                            Expanded(
                              child: Divider(
                                  thickness: 0.5,
                                  color: AppColors.textFieldBorder),
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
            ],
          ),
        ),
      ),
    );
  }
}
