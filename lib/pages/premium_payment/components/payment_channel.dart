import 'package:flutter/material.dart';
import 'package:trybu/core/ui/styles/app_typography.dart';

import '../../../repositories/payment_channel_repositories.dart';

class PaymentChannel extends StatelessWidget {
  const PaymentChannel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final channelPayment = PaymentChannelRepositories();
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(thickness: 0.5,),
      itemCount: channelPayment.channelList.length,
      itemBuilder: (_, index) => ListTile(
        contentPadding: const EdgeInsets.only(left: 0,bottom: 0, top: 0),
        leading: Image.asset(channelPayment.channelList[index].image, width: 42,height: 42,),
        title: Text(channelPayment.channelList[index].nameChannel, style: AppTypography.bodyTextSemiBold(context)!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),),
      ),
    );
  }
}
