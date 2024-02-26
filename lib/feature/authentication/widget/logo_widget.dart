import 'package:flutter/material.dart';
import 'package:flutter_template/core/constant/app_image.dart';
import 'package:flutter_template/core/theme/app_colors.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 188,
      height: 177.31,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.72, -0.70),
          end: const Alignment(-0.72, 0.7),
          colors: [
            AppColor.logoShadowWhiteColor,
            AppColor.logoShadowCreamColor
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: AppColor.logoShadowCloudColor),
          borderRadius: BorderRadius.circular(40),
        ),
        shadows: [
          BoxShadow(
            color: AppColor.logoGreyColor,
            blurRadius: 24,
            offset: const Offset(10, 10),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: AppColor.logoSnowColor,
            blurRadius: 20,
            offset: const Offset(-12, -12),
            spreadRadius: 0,
          )
        ],
      ),
      child: Image.asset(AppImage.logoImage),
    );
  }
}
