// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';


class SocialButtonTile extends StatelessWidget {

  const SocialButtonTile({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;
   @override
   Widget build(BuildContext context) {
       return Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(16)
        ),
        padding:const  EdgeInsets.all(20),
        child: Image.asset(imagePath, height: 25,));
  }
}
