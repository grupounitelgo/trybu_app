// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';

const String imagePath = 'assets/images/logo/';
const String pathIcons = 'assets/icons/';

class AppIcons {
  static const appLogo = '${imagePath}lg.svg';
  static const rectangle = '${imagePath}rectangle.svg';
  static const String google = '${pathIcons}google.png';
  static const String apple = '${pathIcons}apple.png';
  static const String user = '${pathIcons}user.png';
  static const String netWork = '${pathIcons}network.png';
  static const String search = '${pathIcons}search.png';
    static const String notifications = '${pathIcons}notification.png';
    static const String crown = '${pathIcons}crown.png';
    static const String customerService = '${pathIcons}customer-service.png';
    static const String advertisement = '${pathIcons}advertisement.png';
     static const String privacyPolicy = '${pathIcons}privacy-policy.png';
     static const String profile = '${pathIcons}profile.png';
     static const String logout = '${pathIcons}logout.png';
     static const String share = '${pathIcons}share.png';
}

class AppIcon extends StatelessWidget {
  final String icon;
  final Size size;
  final Color color;
  const AppIcon({
    Key? key,
    required this.icon,
    required this.size,
    this.color= AppColors.primaryColor
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: size.width,
      height: size.height,
      color: color,
    );
  }
}
