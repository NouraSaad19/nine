import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class IconsWidget extends StatelessWidget {
  const IconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 19),
        Container(
          width: 36,
          height: 36,
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
              side:
                  BorderSide(width: 0.50, color: AppColor.logoShadowCloudColor),
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: AppColor.logoGreyColor,
                blurRadius: 20,
                offset: const Offset(6, 6),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: AppColor.logoGreyColor,
                blurRadius: 20,
                offset: const Offset(-6, -6),
                spreadRadius: 0,
              )
            ],
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.red,
              size: 24.0,
            ),
            color: AppColor.tiffanyColor,
            highlightColor: AppColor.whiteColor,
          ),
        ),
        const SizedBox(width: 14),
        Container(
          width: 36,
          height: 36,
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
              side:
                  BorderSide(width: 0.50, color: AppColor.logoShadowCloudColor),
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: AppColor.logoGreyColor,
                blurRadius: 20,
                offset: const Offset(6, 6),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: AppColor.logoGreyColor,
                blurRadius: 20,
                offset: const Offset(-6, -6),
                spreadRadius: 0,
              )
            ],
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.mode_comment_outlined,
              color: AppColor.tiffanyColor,
              size: 24.0,
            ),
            color: AppColor.tiffanyColor,
            highlightColor: AppColor.whiteColor,
          ),
        ),
      ],
    );
  }
}
