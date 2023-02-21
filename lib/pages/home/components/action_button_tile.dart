import 'package:flutter/material.dart';

import '../../../core/ui/styles/app_colors.dart';

class ActionButtonTile extends StatelessWidget {
  const ActionButtonTile({Key? key, required this.icon, required this.ontap}) : super(key: key);
  final String icon;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            icon,
            width: 20,
            height: 20,
            color: AppColors.iconColorsAppBar,
          ),
        ),
      ),
    );
  }
}
