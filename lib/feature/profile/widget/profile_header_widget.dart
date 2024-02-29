import 'package:flutter/material.dart';
import 'package:flutter_template/core/theme/app_colors.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        const SizedBox(width: 50),
        Text(
          'صفحة الشخصية',
          style: textTheme.headlineLarge,
        ),
        const SizedBox(width: 50),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
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
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined))
          ],
        )
      ],
    );
  }
}
