import 'package:flutter/material.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';
import 'package:trybu/core/ui/styles/app_icons.dart';
import 'package:trybu/core/ui/styles/app_typography.dart';

class PromotionalCard extends StatelessWidget {
  const PromotionalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                  colors: [AppColors.brownColor, AppColors.brownAccent])),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 2),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Estratégia de Marketing Pessoal",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'com Solange Monteiro',
                          style: TextStyle(color: AppColors.white),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 85, 22, 3)
                                  .withOpacity(0.65),
                              borderRadius: BorderRadius.circular(14)),
                          child: Text(
                            'Hoje - 20:00',
                            style: AppTypography.bodyTextNormal(context)!
                                .copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                      ]),
                ),
              ),
              Positioned(
                top: 1,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/images/promoFoto.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
