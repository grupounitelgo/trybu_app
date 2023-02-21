import 'package:flutter/material.dart';
import 'package:trybu/core/helpers/size_extension.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';
import 'package:trybu/core/ui/styles/app_typography.dart';

class PlanTypes extends StatefulWidget {
  const PlanTypes({Key? key}) : super(key: key);

  @override
  State<PlanTypes> createState() => _PlanTypesState();
}

class _PlanTypesState extends State<PlanTypes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Escolher Planos Premium', style: AppTypography.bodyTextSemiBold(context)!.copyWith(fontWeight: FontWeight.w800,),),
                const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(10),
                width: context.screenWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color:Color.fromARGB(255, 240, 238, 238),
                    border: Border.all(color: Color.fromARGB(255, 110, 72, 72))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Plano semanal',
                      style: AppTypography.bodyTextSemiBold(context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text:  TextSpan(children: [
                            TextSpan(text: 'AOA ', style: AppTypography.bodyTextBold(context)),
                            TextSpan(text: '850', style: AppTypography.bodyTextBold(context)),
                            TextSpan(text: '/semana', style: AppTypography.bodyTextNormal(context)!.copyWith(fontSize: 16,fontWeight: FontWeight.w300))
                          ]),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
               Container(
                padding: const EdgeInsets.all(10),
                width: context.screenWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:AppColors.greyTransparent,
                    border: Border.all(color: AppColors.backgroundColor)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Plano mensal',
                      style: AppTypography.bodyTextSemiBold(context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text:  TextSpan(children: [
                            TextSpan(text: 'AOA ', style: AppTypography.bodyTextBold(context)),
                            TextSpan(text: '1000', style: AppTypography.bodyTextBold(context)),
                            TextSpan(text: '/ mês', style: AppTypography.bodyTextNormal(context)!.copyWith(fontSize: 16,fontWeight: FontWeight.w300))
                          ]),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color.fromARGB(255, 240, 239, 239),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text('Trybu Premium inclui:', style: AppTypography.bodyTextBold(context)!.copyWith(fontWeight: FontWeight.w700, fontSize: 15),),
                  
                   const ItemPlanTile(
                        title: 'Mentoria', icon: Icons.check_circle),
                          const ItemPlanTile(
                        title: 'Marketplace', icon: Icons.check_circle),
                  
                         const ItemPlanTile(
                        title: 'Descontos para formações', icon: Icons.check_circle),
                         const ItemPlanTile(
                        title: 'Descontos para eventos pagos', icon: Icons.check_circle)
                  ],
                ),
              ),
              const Divider(thickness: 0.5,),
              const SizedBox(height: 10,),
              Text('Ficha do pedido', style: AppTypography.bodyTextBold(context),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const[
                  Text('Pagamento mensal:'),
                  Text('1500 AOA')
                ],
              ),
              const Divider(thickness: 0.5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(text: 'Desconto: ', style: AppTypography.bodyTextBold(context)!.copyWith(color: AppColors.yellow,fontSize: 13)),
                      TextSpan(text: '30% de desconto', style: AppTypography.bodyTextNormal(context)!.copyWith(
                        fontWeight: FontWeight.w300
                      ))
                    ]
                  ),),
                  const Text('4,50 AO')
                ],
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: context.screenWidth,
                height: 45,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, 'paymentPremium');
                }, child: Text('Pagar plano', style: AppTypography.bodyTextBold(context)!.copyWith(color: AppColors.white, fontSize: 16),)),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class ItemPlanTile extends StatelessWidget {
  const ItemPlanTile({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(bottom: 0,top: 0),
      leading: Icon(
        icon,
        color: Colors.green,
        size:16
      ),
      title: Text(title),
    );
  }
}
/*
 

 */