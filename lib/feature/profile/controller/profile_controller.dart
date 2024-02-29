import 'package:flutter/material.dart';
import 'package:flutter_template/feature/profile/service/profile_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = ProfileService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? profilePhoto = '';

  @override
  void onInit() async {
    await getUserInfo();
    super.onInit();
  }

  getUserInfo() {
    var user = _profileService.getUserInfo(
      uid: 'NH009G46nbfp8CQqcHBfpjnBgZF3',
      onError: (String e) {
        Get.snackbar(
          'something went wrong',
          e,
        );
      },
    );
    nameController.text = user?.displayName ?? 'Hello user';
    emailController.text = user?.email ?? 'example@gmail.com';
    profilePhoto = user?.photoURL;

    print('nameController.text ${nameController.text}');
  }
}
