
import 'package:flutter/material.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';
import 'package:trybu/core/ui/styles/app_style.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    Key? key,
    required this.textButton,
    this.onTextLoad,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);
  final String textButton;
  final void Function()? onPressed;
  final bool isLoading;
  final String? onTextLoad;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppStyle.elevatedButtonTheme,
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                 const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.50,
                      color: AppColors.primaryColor,
                      backgroundColor: AppColors.primaryColor,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.white),
                    ),
                  ),
                 const SizedBox(width: 5),
                  Text('$onTextLoad...')
                ],
              )
            :  Text(textButton),
      ),
    );
  }
}
