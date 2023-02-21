import 'package:flutter/material.dart';
import 'package:trybu/core/ui/theme/app_theme.dart';
import 'package:trybu/pages/splash_screen/splash_page.dart';
import '../pages/home/home_page.dart';
import '../pages/premium_payment/premium_payment_page.dart';
import '../pages/sign_in/sign_in_page.dart';
import '../pages/sign_up/sign_up_page.dart';
import '../pages/welcome/welcome_page.dart';

class AppTrybu extends StatelessWidget {
  const AppTrybu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trybu',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context)=>const SplashPage(),
        'welcome': (context)=>const WelcomePage(),
         'signInPage': (context)=>const SignInPage(),
        'signUpPage': (context)=>const SignUpPage(),
        'homePage': (context)=>const HomePage(),
        'paymentPremium': (context)=>const PremiumPaymentPage()
      },
    );
  }
}
