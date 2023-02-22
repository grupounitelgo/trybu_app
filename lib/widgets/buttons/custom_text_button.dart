import 'package:flutter/material.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';

class CustomizeTextButton extends StatelessWidget {
  const CustomizeTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.primaryColor),
      ),
    );
  }
}