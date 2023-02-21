import 'package:flutter/material.dart';
import 'package:trybu/core/helpers/size_extension.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';
import 'package:trybu/core/ui/styles/app_icons.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  init() async {
    Future.delayed(
      const Duration(seconds: 4),
    ).then(
      (value) => Navigator.pushNamed(context, 'welcome'),
    );
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
            
             Image.asset('assets/images/logoTr.png', width: 67, height:67, color: AppColors.brownColor,),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  strokeWidth: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
