import 'package:flutter/material.dart';
import 'package:flutter_template/core/extension/spaceing_extentsion.dart';
import 'package:get/get.dart';
import '../../../core/constant/app_image.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: 0.1658.height(context),
          ),
          SizedBox(
              height: 0.2962.height(context),
              width: 0.6410.width(context),
              child: Image.asset(
                AppImage.logoImage,
                fit: BoxFit.fill,
              )),
          SizedBox(height: 0.0473.height(context)),
          SizedBox(
            height: 0.0426.height(context),
            width: 1.0410.width(context),
            child: Text(
              ' المكان الى يجمعنا ',
              textAlign: TextAlign.center,
              style: textTheme.headlineLarge!.copyWith(
                fontSize: 24,
                shadows: <Shadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 5,
                    spreadRadius: -1.0,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.30),
                    offset: const Offset(-3.0, -3.0),
                    blurRadius: 5,
                    spreadRadius: -1.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 0.296.height(context)),
          SizedBox(
            height: 0.0426.height(context),
            width: 1.0410.width(context),
            child: Text(
              '❤ صنع بحب من قلب الكراج    ',
              textAlign: TextAlign.center,
              style: textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w700,
                shadows: <Shadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.30),
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 5,
                    spreadRadius: -1.0,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.30),
                    offset: const Offset(-3.0, -3.0),
                    blurRadius: 5,
                    spreadRadius: -1.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
