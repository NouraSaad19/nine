import 'package:flutter/material.dart';
import 'package:flutter_template/common/widget/logo_widget.dart';
import 'package:flutter_template/core/extension/spaceing_extentsion.dart';
import 'package:flutter_template/feature/authentication/widget/forget_password_widget.dart';
import 'package:get/get.dart';
import '../../../common/widget/text_field_widget.dart';
import '../../../core/route/route.dart';
import '../../../core/theme/app_colors.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final AuthController authController = AuthController();
    final isFalse = false;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 0.0710.height(context),
          ),
          const LogoWidget(),
          SizedBox(height: 0.0213.height(context)),
          Column(
            children: [
              SizedBox(
                height: 0.0426.height(context),
                width: 1.0410.width(context),
                child: Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: Text(
                    "...  حياكم الله مجددا       ",
                    textAlign: TextAlign.end,
                    style: textTheme.headlineLarge!.copyWith(
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
              ),
              Padding(
                padding: const EdgeInsets.only(right: 26.0),
                child: SizedBox(
                  height: 0.0426.height(context),
                  width: 1.0410.width(context),
                  child: Text(
                    '... أسفرت وأنورت     ',
                    textAlign: TextAlign.center,
                    style: textTheme.headlineLarge!.copyWith(
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
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Material(
                      elevation: 10,
                      shadowColor: AppColor.whiteColor,
                      child: SizedBox(
                        height: 0.0592.height(context),
                        width: 1.0.width(context),
                        child: TextFieldWidget(
                          controller: authController.emailController,
                          hintText: 'البريد الاكتروني',
                          prefixIcon: const Icon(Icons.email_outlined),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'لم تقم بإدخال أي قيمة';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.02369.height(context),
                    ),
                    Material(
                      elevation: 10,
                      shadowColor: AppColor.whiteColor,
                      child: SizedBox(
                        height: 0.0592.height(context),
                        width: 1.0.width(context),
                        child: TextFieldWidget(
                          controller: authController.passwordController,
                          hintText: 'كلمة المرور',
                          prefixIcon: const Icon(Icons.lock_outlined),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'لم تقم بإدخال أي قيمة';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            MediaQuery.removePadding(
                              removeRight: true,
                              removeLeft: true,
                              context: context,
                              child: Checkbox(
                                side: BorderSide(
                                    width: 1, color: AppColor.orangeColor),
                                value: false,
                                checkColor: AppColor.whiteColor,
                                activeColor: AppColor.orangeColor,
                                onChanged: (value) {
                                  value = isFalse;
                                },
                              ),
                            ),
                            Text('تذكرني ', style: textTheme.headlineMedium),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                            Get.bottomSheet(
                                ignoreSafeArea: false,
                                isScrollControlled: true,
                                const ForgetPassWordWidget());
                          },
                          child: Text(
                            ' هل نسيت كلمة المرور ؟  ',
                            style: textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.0710.height(context),
                    ),
                    SizedBox(
                      height: 0.05687.height(context),
                      width: 0.9230.width(context),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'الدخول',
                          style: textTheme.displayLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.0118.height(context)),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.singUpScreen);
                      },
                      child: Text(
                        'للتسجيل معانا',
                        style: textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
