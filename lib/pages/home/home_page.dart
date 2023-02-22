import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trybu/core/helpers/size_extension.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';
import 'package:trybu/core/ui/styles/app_icons.dart';
import 'package:trybu/core/ui/styles/app_typography.dart';
import 'package:trybu/pages/home/components/bottom_navigation_bar_component.dart';
import 'package:trybu/pages/home/components/event_list_tile.dart';

import '../../repositories/event_repositories.dart';
import 'components/action_button_tile.dart';
import 'components/drawer_component.dart';
import 'components/lets_support_you.dart';
import 'components/promotional_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final eventRepositories = EventRepositories();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser!;
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      key: _scaffoldKey,
      drawer:  DrawerComponent(userEmail: user.email!),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: context.screenWidth,
                      padding: const EdgeInsets.only(left: 8, bottom: 16),
                    color: AppColors.backgroundColor,
                      height: 65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActionButtonTile(icon: AppIcons.user,ontap: ()=>_scaffoldKey.currentState!.openDrawer(),),
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                             ActionButtonTile(icon: AppIcons.search, ontap: (){}),
                                const SizedBox(
                                  width: 10,
                                ),
                                ActionButtonTile(icon: AppIcons.notifications, ontap: (){}),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 6),
                      child: Text(
                        'Boa tarde',
                        style: AppTypography.bodyTextBold(context)!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        '2.347 pessoas estão aqui hoje',
                        style: AppTypography.bodyTextNormal(context)!
                            .copyWith(color: AppColors.grey),
                      ),
                    ),
                    const PromotionalCard(),
                    const SizedBox(
                      height: 10,
                    ),
                    const LetsSupportYou(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Eventos',
                            style: AppTypography.bodyTextBold(context),
                          ),
                          Text(
                            'Ver todos',
                            style: AppTypography.bodyTextNormal(context)!
                                .copyWith(color: AppColors.grey, fontSize: 13),
                          )
                        ],
                      ),
                    ),
                   
                    EventListTile(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarComponent(currentIndex: currentIndex)
    );
  }
}
