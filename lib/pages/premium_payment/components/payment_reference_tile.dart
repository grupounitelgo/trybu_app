import 'package:flutter/material.dart';

import '../../../core/ui/styles/app_colors.dart';
import '../../../core/ui/styles/app_typography.dart';

class PaymentReferenceTile extends StatelessWidget {
  const PaymentReferenceTile(
      {Key? key,
      required this.title,
      required this.code,
      })
      : super(key: key);
  final String title;
  final int code;
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.bodyTextNormal(context)!.copyWith(
                    fontWeight: FontWeight.w800, color:Colors.grey, fontSize: 14),
              ),
              Text(
                code.toString(),
                style: AppTypography.bodyTextSemiBold(context)!
                    .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.copy_outlined,
              color: AppColors.brownColor,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
