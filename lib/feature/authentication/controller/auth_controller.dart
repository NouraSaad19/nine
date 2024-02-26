import 'package:flutter/material.dart';
import 'package:flutter_template/feature/authentication/service/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // signUpWithEmail(
  //   String email,
  //   String password,
  //   String name,
  // ) async {
  //   await _authService.signUpWithEmailFirebase(
  //     email: email,
  //     password: password,
  //     name: name,
  //     onDone: (String? uid) async {
  //       if (uid != null) {
  //         await authStorage.write(AppKeys.authKey, uid);
  //         addRole(uId: authStorage.read(AppKeys.authKey), email: email);

  //         clearControllers();
  //         Get.offNamed(Routes.profileScreen);
  //       }
  //     },
  //     onError: (String e) {
  //       Get.snackbar(
  //         'something went wrong',
  //         e,
  //       );
  //     },
  //   );
  // }
}
