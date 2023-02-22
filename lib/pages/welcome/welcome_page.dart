import 'package:flutter/material.dart';
import 'package:trybu/core/helpers/size_extension.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';
import 'package:trybu/core/ui/styles/app_style.dart';
import 'package:flutter/services.dart';
import '../../core/ui/styles/app_typography.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.backgroundColor));
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
         decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/2.jpg', ), fit: BoxFit.cover)
                  ),
          width: context.screenWidth,
          height: context.screenHeight,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/2.jpg'))
                  )
                )
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
                  decoration:
                      const BoxDecoration(color: AppColors.backgroundColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            'Bem-vindo a\nTrybu',
                            style: AppTypography.bodyTextBold(context)!
                                .copyWith(
                                    fontSize: 30, fontWeight: FontWeight.w900),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            'Para mulheres que desejam assumir o controlo do espectáculo de suas vidas',
                            style: AppTypography.bodyTextNormal(context)!
                                .copyWith(
                                    fontSize: 15, color: AppColors.black54),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            'Atreve-te',
                            style:
                                AppTypography.bodyTextBold(context)!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: AppColors.brownColor,
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, 'signInPage'),
                          child: const Text('Entrar'),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 45,
                        child: OutlinedButton(
                          style: AppStyle.outlineButtonTheme,
                          onPressed: () =>
                              Navigator.pushNamed(context, 'signUpPage'),
                          child: const Text('Registar'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
