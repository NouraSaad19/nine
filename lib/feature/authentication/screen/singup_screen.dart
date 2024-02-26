import 'package:flutter/material.dart';
import 'package:flutter_template/common/widget/text_field_widget.dart';
import 'package:flutter_template/core/constant/app_image.dart';
import 'package:flutter_template/core/extension/spaceing_extentsion.dart';
import 'package:flutter_template/feature/authentication/controller/auth_controller.dart';

class Singup extends StatelessWidget {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final AuthController authController = AuthController();
    return Scaffold(
      backgroundColor: const Color(0xFFE9EDF0),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 0.0829.height(context)),
        child: Column(
          children: [
            Image.asset(
              AppImage.logoImage,
              height: size.height * 0.20,
              width: size.width * 0.50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 140),
              child: Image.asset(
                AppImage.welcomeImage,
                width: size.width * 0.50,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Material(
                      elevation: 10,
                      shadowColor: Colors.white,
                      child: TextFieldWidget(
                          controller: authController.nameController,
                          hintText: 'الاسم',
                          prefixIcon: const Icon(Icons.person_outline),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'لم تقم بإدخال أي قيمة';
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(
                      height: 0.0248.height(context),
                    ),
                    Material(
                      elevation: 10,
                      shadowColor: Colors.white,
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
                          }),
                    ),
                    SizedBox(
                      height: 0.0248.height(context),
                    ),
                    Material(
                      elevation: 10,
                      shadowColor: Colors.white,
                      child: TextFieldWidget(
                          controller: authController.passwordController,
                          hintText: 'كلمة السر',
                          prefixIcon: const Icon(Icons.lock_outlined),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'لم تقم بإدخال أي قيمة';
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(
                      height: 0.0248.height(context),
                    ),
                    Material(
                      elevation: 10,
                      shadowColor: Colors.white,
                      child: TextFieldWidget(
                          controller: authController.confirmPasswordController,
                          hintText: 'كرر كلمه السر',
                          prefixIcon: const Icon(Icons.lock_outlined),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'لم تقم بإدخال أي قيمة';
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(
                      height: 0.0533.height(context),
                    ),
                    SizedBox(
                      width: 0.8333.height(context),
                      height: 0.0568.height(context),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'تسجيل',
                            style: textTheme.displayLarge,
                          )),
                    ),
                    SizedBox(
                      height: 0.0343.height(context),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'الدخول',
                          style: textTheme.labelMedium,
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
