import 'package:flutter/material.dart';
import 'package:flutter_template/common/widget/logo_widget.dart';
import 'package:flutter_template/common/widget/text_field_widget.dart';
import 'package:flutter_template/core/constant/validation.dart';
import 'package:flutter_template/core/extension/spaceing_extentsion.dart';
import 'package:flutter_template/core/route/route.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/feature/authentication/controller/auth_controller.dart';
import 'package:get/get.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    final AuthController authController = AuthController();
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
                    '...  ضيف جديد ',
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
                    '... عينٍ ترحب بك ، وعينٍ تهلي  ',
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
            ],
          ),
          SizedBox(
            height: 0.01184.height(context),
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
                          controller: authController.nameController,
                          hintText: 'الاسم',
                          prefixIcon: const Icon(Icons.person_outline),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'لم تقم بإدخال أي قيمة';
                            } else if (value.toString().length < 3) {
                              return 'الاسم يجب ان يكون طوله ٣ حروف على الاقل';
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(
                      height: 0.02369.height(context),
                    ),
                    Material(
                      elevation: 10,
                      shadowColor: AppColor.whiteColor,
                      child: TextFieldWidget(
                        controller: authController.emailController,
                        hintText: 'البريد الاكتروني',
                        prefixIcon: const Icon(Icons.email_outlined),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'لم تقم بإدخال أي قيمة';
                          } else if (!Validation.isValidEmailExtension(value)) {
                            return 'يجب ان يكون الايميل ايميل الكراج';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 0.02369.height(context),
                    ),
                    Material(
                      elevation: 10,
                      shadowColor: AppColor.whiteColor,
                      child: TextFieldWidget(
                          controller: authController.passwordController,
                          hintText: 'كلمة المرور',
                          prefixIcon: IconButton(
                            onPressed: () {
                              authController.visibilityPassword();
                            },
                            icon: Icon(
                              authController.isVisibilityPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'لم تقم بإدخال أي قيمة';
                            } else if (value.toString().length < 6) {
                              return 'كلمه السر يجب ان يكون طوله ٦ حروف على الاقل';
                            } else if (!RegExp(Validation.validationUppercase)
                                .hasMatch(value)) {
                              return 'كلمة السر يجب ان تحتوي على حرف كبير واحد على الاقل';
                            } else if (!RegExp(Validation.validationLowercase)
                                .hasMatch(value)) {
                              return 'كلمة السر يجب ان تحتوي على حرف صغير واحد على الاقل';
                            } else if (!RegExp(Validation.validationDigit)
                                .hasMatch(value)) {
                              return 'كلمة السر يجب ان تحتوي على رقم واحد على الاقل';
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(
                      height: 0.02369.height(context),
                    ),
                    Material(
                      elevation: 10,
                      shadowColor: AppColor.whiteColor,
                      child: TextFieldWidget(
                        controller: authController.confirmPasswordController,
                        hintText: 'كرر كلمه المرور',
                        prefixIcon: IconButton(
                          onPressed: () {
                            authController.visibilityConfirmPassword();
                          },
                          icon: Icon(
                            authController.isVisibilityConfirm
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'لم تقم بإدخال أي قيمة';
                          } else if (value !=
                              authController.passwordController.text) {
                            return 'غير متطابق مع كلمه السر';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      height: 0.0473.height(context),
                    ),
                    SizedBox(
                      height: 0.05687.height(context),
                      width: 0.9230.width(context),
                      child: ElevatedButton(
                        onPressed: () {
                          (_formKey.currentState!.validate())
                              ? authController.signUpWithEmail(
                                  authController.emailController.text,
                                  authController.passwordController.text,
                                  authController.nameController.text)
                              : null;
                        },
                        child: Text(
                          'تسجيل',
                          style: textTheme.displayLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.0118.height(context)),
                    TextButton(
                      onPressed: () {
                        authController.clearControllers();
                        Get.toNamed(Routes.loginScreen);
                      },
                      child: Text(
                        'الدخول',
                        style: textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
