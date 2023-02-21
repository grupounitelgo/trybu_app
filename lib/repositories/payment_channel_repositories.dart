import 'package:trybu/model/payment_channel_model.dart';

class PaymentChannelRepositories {
  List<PaymentChannelModel> channelList = [];

  PaymentChannelRepositories() {
    channelList.addAll([
      PaymentChannelModel(
          image: 'assets/images/paymentChannel/unitel_money.png',
          nameChannel: 'Unitel Money'),
      PaymentChannelModel(
          image: 'assets/images/paymentChannel/logo_express.png',
          nameChannel: 'Multicaixa Express'),
      PaymentChannelModel(
          image: 'assets/images/paymentChannel/paypay-logo.png',
          nameChannel: 'Pay Pay AO'),
    ]);
  }
}
