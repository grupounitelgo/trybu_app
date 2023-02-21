import 'package:flutter/material.dart';
import 'package:trybu/core/helpers/size_extension.dart';
import 'package:trybu/core/ui/styles/app_typography.dart';
import 'components/payment_channel.dart';
import 'components/payment_reference_tile.dart';

class PremiumPaymentPage extends StatefulWidget {
  const PremiumPaymentPage({Key? key}) : super(key: key);

  @override
  State<PremiumPaymentPage> createState() => _PremiumPaymentPageState();
}

class _PremiumPaymentPageState extends State<PremiumPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 16,
                          )),
                    ),
                  ),
                  Text('Aderir conta premium',
                      style: AppTypography.bodyTextNormal(context)!.copyWith(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,),),
                  const SizedBox(
                    width: 50,
                  )
                 
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  'Para adesão da conta Premium utilize os seguintes meios para efectuar esta operação',
                  style: AppTypography.bodyTextNormal(context)!.copyWith(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 0.5,
              ),
              const PaymentReferenceTile(
                title: 'Entidade',
                code: 03923,
              ),
              const Divider(
                thickness: 0.5,
              ),
              const PaymentReferenceTile(title: 'Referência', code: 0256636),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Facilitamos o acesso a conta Premium tornando ele simples e seguro',
                style: AppTypography.bodyTextNormal(context)!.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Utilize um dos meios como alternativa para efectuar pagamento',
                  style: AppTypography.bodyTextNormal(context)!.copyWith(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),),
                      const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: context.percentHeight(30),
                child: const PaymentChannel(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
