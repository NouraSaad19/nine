import 'package:flutter/material.dart';
import 'package:flutter_template/core/constant/app_image.dart';
import 'package:flutter_template/core/theme/app_colors.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  final String title;
  const ProfileHeaderWidget(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 90, right: 30, left: 130),
      child: Row(
        children: [
          Text(
            title,
            style: textTheme.headlineMedium,
          ),
          const SizedBox(width: 40),
          InkWell(
            child: Container(
              height: 36,
              width: 36,
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
                  side: BorderSide(
                      width: 0.50, color: AppColor.logoShadowCloudColor),
                  borderRadius: BorderRadius.circular(100),
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
                  ),
                ],
              ),
              child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    icon,
                    size: 15,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
