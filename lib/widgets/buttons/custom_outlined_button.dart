import 'package:flutter/material.dart';
import 'package:trybu/core/helpers/size_extension.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: AppColors.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
