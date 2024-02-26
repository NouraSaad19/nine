import 'package:flutter/material.dart';
import 'package:flutter_template/core/extension/spaceing_extentsion.dart';
import '../../core/theme/app_colors.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 0.21.height(context),
        width: 0.48.width(context),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.72, -0.70),
            end: const Alignment(-0.72, 0.7),
            colors: [AppColor.logoShadowWhiteColor, AppColor.logoShadowCreamColor],
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
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.1045.height(context),
              width: 0.219.width(context),
              child: Stack(
                children: [
                  for (double left in [0, 29.69, 59.38])
                    for (double top in [0, 31.07, 62.15])
                      Positioned(
                        left: left,
                        top: top,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            height: 0.0309.height(context),
                            width: 0.0671.width(context),
                            decoration: BoxDecoration(
                              color: AppColor.tiffanyColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                height: 0.0236.height(context),
                                width: 0.0512.width(context),
                                decoration: BoxDecoration(
                                  color: AppColor.tiffanyColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      offset: const Offset(-1.0, -4.0),
                                      blurRadius: 5.0,
                                      spreadRadius: -1.0,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.1),
                                      offset: const Offset(3.0, 3.0),
                                      blurRadius: 3.0,
                                      spreadRadius: -1.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ),
            Text(
              'تسعة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: AppColor.tiffanyColor,
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(3.0, -3.0),
                    blurRadius: 3.0,
                    spreadRadius: -1.0,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.6),
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 3.0,
                    spreadRadius: -1.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
