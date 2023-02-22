import 'package:flutter/material.dart';
import 'package:trybu/core/helpers/size_extension.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';
import 'package:trybu/core/ui/styles/app_icons.dart';
import 'package:trybu/core/ui/styles/app_typography.dart';
import 'package:trybu/pages/home/components/action_button_tile.dart';
import 'package:trybu/stores/plan_types/plan_types_store.dart';

import 'components/item_plane_type.dart';

class PlanTypes extends StatefulWidget {
  const PlanTypes({Key? key}) : super(key: key);

  @override
  State<PlanTypes> createState() => _PlanTypesState();
}

class _PlanTypesState extends State<PlanTypes> {
  final planTypesStore = PlanTypesStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: Card(
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
                child: const Icon(Icons.arrow_back,
                    size: 16, color: AppColors.black54)),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Escolher planos Premium',
          style: AppTypography.bodyTextSemiBold(context)!.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: planTypesStore.tooglePlan1,
                      child: Container(
                        padding: const EdgeInsets.only(top: 30, bottom: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: const Color.fromARGB(255, 240, 238, 238),
                          border: Border.all(
                              color: const Color.fromARGB(255, 110, 72, 72)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Plano semanal',
                              style: AppTypography.bodyTextSemiBold(context)!
                                  .copyWith(fontSize: 14),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'AOA ',
                                        style: AppTypography.bodyTextBold(
                                            context)),
                                    TextSpan(
                                        text: '850',
                                        style: AppTypography.bodyTextBold(
                                            context)),
                                    TextSpan(
                                        text: '/semana',
                                        style: AppTypography.bodyTextNormal(
                                                context)!
                                            .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300))
                                  ]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: planTypesStore.tooglePlan2,
                      child: Container(
                        padding: const EdgeInsets.only(top: 30, bottom: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 240, 238, 238),
                          border: Border.all(color: AppColors.backgroundColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Plano mensal',
                              style: AppTypography.bodyTextSemiBold(context)!
                                  .copyWith(fontSize: 14),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'AOA ',
                                        style: AppTypography.bodyTextBold(
                                            context)),
                                    TextSpan(
                                        text: '1000',
                                        style: AppTypography.bodyTextBold(
                                            context)),
                                    TextSpan(
                                        text: '/ mês',
                                        style: AppTypography.bodyTextNormal(
                                                context)!
                                            .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300))
                                  ]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trybu Premium inclui:',
                      style: AppTypography.bodyTextBold(context)!
                          .copyWith(fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    const ItemPlanTile(
                        title: 'Mentoria', icon: Icons.check_circle),
                    const ItemPlanTile(
                        title: 'Marketplace', icon: Icons.check_circle),
                    const ItemPlanTile(
                        title: 'Descontos para formações',
                        icon: Icons.check_circle),
                    const ItemPlanTile(
                        title: 'Descontos para eventos pagos',
                        icon: Icons.check_circle)
                  ],
                ),
              ),
              const Divider(
                thickness: 0.5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Ficha do pedido',
                style: AppTypography.bodyTextBold(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text('Pagamento mensal:'), Text('1500 AOA')],
              ),
              const Divider(
                thickness: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Desconto: ',
                          style: AppTypography.bodyTextBold(context)!
                              .copyWith(color: AppColors.yellow, fontSize: 13)),
                      TextSpan(
                          text: '30% de desconto',
                          style: AppTypography.bodyTextNormal(context)!
                              .copyWith(fontWeight: FontWeight.w300))
                    ]),
                  ),
                  const Text('4,50 AO')
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: context.screenWidth,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'paymentPremium');
                  },
                  child: Text(
                    'Pagar plano',
                    style: AppTypography.bodyTextBold(context)!
                        .copyWith(color: AppColors.white, fontSize: 16),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}


/*
 

 */