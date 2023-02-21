import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  const SocialButtonWidget({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 22,
          child: Image.asset(image),
        ),
      ),
    );
  }
}
