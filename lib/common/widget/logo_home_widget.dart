import 'package:flutter/material.dart';
import 'package:flutter_template/core/extension/spaceing_extentsion.dart';
import '../../core/theme/app_colors.dart';

class LogoHomeWidget extends StatelessWidget {
  const LogoHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 0.08.height(context),
              width: 0.18.width(context),
              child: Stack(
                children: [
                  for (double left in [
                    0,
                    14.84,
                    29.69
                  ])
                    for (double top in [
                      0,
                      15.54,
                      31.07
                    ])
                      Positioned(
                        left: left,
                        top: top,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            height: 0.015.height(context),
                            width: 0.033.width(context),
                            decoration: BoxDecoration(
                              color: AppColor.tiffanyColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                height: 0.0118.height(context),
                                width: 0.0256.width(context),
                                decoration: BoxDecoration(
                                  color: AppColor.tiffanyColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      offset: const Offset(-0.5, -2.0),
                                      blurRadius: 2.5,
                                      spreadRadius: -0.5,
                                    ),
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.1),
                                      offset: const Offset(1.5, 1.5),
                                      blurRadius: 1.5,
                                      spreadRadius: -0.5,
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
          ],
        ),
      ],
    );
  }
}
