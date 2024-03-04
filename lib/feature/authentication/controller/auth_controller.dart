import 'package:flutter/material.dart';
import 'package:flutter_template/core/route/route.dart';
import 'package:flutter_template/feature/authentication/service/auth_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/constant/keys.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  GetStorage authStorage = GetStorage();

  bool isCheck = false;
  bool isVisibility = true;
  bool isVisibilityPassword = false;
  bool isVisibilityConfirm = false;

  signUpWithEmail(
    String email,
    String password,
    String name,
  ) async {
    await _authService.signUpWithEmailFirebase(
      email: email,
      password: password,
      name: name,
      onDone: (String? uid) async {
        if (uid != null) {
          clearControllers();
          Get.snackbar(
              '', 'الرجاء التوجه على بريدك الاكتروني حتى يتم تفعيل الحساب');
          Get.offNamed(Routes.loginScreen);
        }
      },
      onError: (String e) {
        Get.snackbar(
          'something went wrong',
          e,
        );
      },
    );
  }

  loginWithEmail(
    String email,
    String password,
  ) async {
    await _authService.loginWithEmailFirebase(
      email: email,
      password: password,
      onDone: (String? uid) async {
        if (uid != null) {
          await authStorage.write(Keys.authKey, uid);
          clearControllers();
          Get.offNamed(Routes.profileScreen);
        }
      },
      onError: (String e) {
        Get.snackbar(
          'Login failed',
          e,
        );
      },
    );
  }

  void loginWithGetStorage(String email, String password, bool isSignIn) async {
    await GetStorage().write(Keys.emailKey, email);
    await GetStorage().write(Keys.loginSaveKey, isSignIn);
    update();
  }

  // void logOut() async {
  //   await storage.remove(Keys.emailKey);
  //   await storage.remove(Keys.loginSaveKey);
  //   update();
  // }

  clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void updateCheckBox(bool value) {
    isCheck = value;
    update();
  }

  void visibility() {
    isVisibility = !isVisibility;
    print(" hi  $isVisibility");
    update();
  }

  void visibilityPassword() {
    isVisibilityPassword = !isVisibilityPassword;
    update();
  }

  void visibilityConfirmPassword() {
    isVisibilityConfirm = !isVisibilityConfirm;
    update();
  }
}
