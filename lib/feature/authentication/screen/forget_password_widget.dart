import 'package:flutter/material.dart';
import 'package:flutter_template/common/widget/logo_widget.dart';
import 'package:flutter_template/core/constant/validation.dart';
import 'package:flutter_template/core/extension/spaceing_extentsion.dart';
import 'package:flutter_template/core/route/route.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:get/get.dart';

import '../../../common/widget/text_field_widget.dart';
import '../controller/auth_controller.dart';

class ForgetPassWordWidget extends StatelessWidget {
  ForgetPassWordWidget({super.key});
  final _authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 0.0710.height(context),
      ),
      const LogoWidget(),
      SizedBox(height: 0.0213.height(context)),
      Column(children: [
        SizedBox(
          height: 0.0426.height(context),
          width: 1.0410.width(context),
          child: Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Text(
              '  نسيت كلمة المرور ؟       ',
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
              '...ولا تشيل هم     ',
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
        SizedBox(
          height: 0.04369.height(context),
        ),
        GetBuilder<AuthController>(builder: (authController) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Material(
                    elevation: 10,
                    shadowColor: AppColor.whiteColor,
                    child: TextFieldWidget(
                      controller: authController.emailController,
                      hintText: 'البريد الإلكتروني',
                      prefixIcon: const Icon(Icons.email_outlined),
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'لم تقم بإدخال أي قيمة';
                        } else if (!Validation.isValidEmailExtension(value)) {
                          return 'يجب أن يكون البريد الإلكتروني بريد الكراج';
                        } else if (!value.toString().contains('@')) {
                          return 'البريد الإلكتروني يجب أن يحتوي على علامة @';
                        } else if (value.toString().length < 5) {
                          return 'البريد الإلكتروني قصير جداً';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 0.05369.height(context),
                  ),
                  SizedBox(
                    height: 0.05687.height(context),
                    width: 0.9230.width(context),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _authController.forgotPassword(
                              _authController.emailController.text);
                        }
                      },
                      child: Text(
                        'إرسال',
                        style: textTheme.displayLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.0118.height(context)),
                  TextButton(
                    onPressed: Get.back,
                    child: Text(
                      ' الدخول',
                      style: textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ])
    ]));
  }
}
