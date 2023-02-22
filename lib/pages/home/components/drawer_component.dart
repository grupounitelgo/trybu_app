import 'package:flutter/material.dart';
import 'package:trybu/core/helpers/size_extension.dart';
import '../../../core/ui/styles/app_colors.dart';
import '../../../core/ui/styles/app_icons.dart';
import '../../../core/ui/styles/app_typography.dart';
import '../../premium_payment/plan_types/plan_types.dart';
import '../home_page.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key, required this.userEmail}) : super(key: key);
  final String userEmail;
  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPictureSize: const Size(46, 46),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: AppColors.grey,
                  child: Image.asset(
                    AppIcons.user,
                    width: 30,
                    height: 30,
                  )),
              accountName: const Text('Grupo 3'),
              accountEmail: Text(widget.userEmail)),
          ListTile(
            leading: Image.asset(
              AppIcons.user,
              width: 30,
              height: 30,
            ),
            title: const Text('Perfil'),
            onTap: (() {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const HomePage()));
            }),
          ),
          ListTile(
            leading: Image.asset(
              AppIcons.crown,
              width: 30,
              height: 30,
            ),
            title: const Text('Aderir Trybu Premium'),
            onTap: (() {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PlanTypes()));
            }),
          ),
          ListTile(
            leading: Image.asset(
              AppIcons.advertisement,
              width: 30,
              height: 30,
            ),
            title: const Text('Anunciar evento'),
            onTap: (() {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const HomePage()));
            }),
          ),
          ListTile(
            leading: Image.asset(
              AppIcons.share,
              width: 30,
              height: 30,
            ),
            title: const Text('Partilhar com amigos'),
            onTap: (() {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const HomePage()));
            }),
          ),
          ListTile(
            leading: Image.asset(
              AppIcons.profile,
              width: 30,
              height: 30,
            ),
            title: const Text('Definições'),
            onTap: (() {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Container()));
            }),
          ),
          ListTile(
            leading: Image.asset(
              AppIcons.customerService,
              width: 30,
              height: 30,
            ),
            title: const Text('Suporte'),
            onTap: (() {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const HomePage()));
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Image.asset(
              AppIcons.logout,
              width: 30,
              height: 30,
            ),
            title: const Text('Sair'),
            onTap: (() {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Container()));
            }),
          ),
        ],
      ),
    );
  }

  showModal() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        color: AppColors.backgroundColor,
        width: context.screenWidth,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Planos premium'),
                  GestureDetector(
                    onTap: (() => Navigator.of(context).pop()),
                    child: const Icon(Icons.close,
                        color: AppColors.grey, size: 15),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                      child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Plano semanal',
                            style: AppTypography.bodyTextBold(context),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '100 ',
                                  style: AppTypography.bodyTextBold(context)!
                                      .copyWith(fontSize: 25)),
                              TextSpan(
                                  text: 'AOA',
                                  style:
                                      AppTypography.bodyTextSemiBold(context)!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))
                            ]),
                          )
                        ]),
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Card(
                      child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Plano mensal',
                            style: AppTypography.bodyTextBold(context),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '1000 ',
                                  style: AppTypography.bodyTextBold(context)!
                                      .copyWith(fontSize: 25)),
                              TextSpan(
                                  text: 'AOA',
                                  style:
                                      AppTypography.bodyTextSemiBold(context)!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))
                            ]),
                          )
                        ]),
                  )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                    child: Text(
                      'Activar plano mensal',
                      style: AppTypography.bodyTextSemiBold(context)!.copyWith(
                          fontWeight: FontWeight.w600, color: AppColors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'paymentPremium');
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
