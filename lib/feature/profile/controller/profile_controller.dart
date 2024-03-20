import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/constant/keys.dart';
import 'package:flutter_template/core/route/route.dart';
import 'package:flutter_template/feature/profile/service/profile_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = ProfileService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? profilePhoto = '';
  GetStorage authStorage = GetStorage();
  File? pickedFileApp;
  bool isLoading = false;

  @override
  void onInit() async {
    await getUserInfo();
    super.onInit();
  }

  void clearPickedFile() {
    pickedFileApp = null;
    update();
  }

  getUserInfo() {
    var user = _profileService.getUserInfo(
      uid: authStorage.read(Keys.authKey),
      onError: (e) {
        Get.snackbar('something went wrong', e.toString());
      },
    );
    nameController.text = user?.displayName ?? 'Hello user';
    emailController.text = user?.email ?? 'example@thegarage.sa';
    profilePhoto = user?.photoURL;
  }

  updateUserName({required String userName}) async {
    await _profileService.updateUserName(
      userName: userName,
      onError: (e) {
        Get.snackbar('something went wrong', e.toString());
      },
      onDone: () async {
        await getUserInfo();
        update();
        Get.offNamed(Routes.profileScreen);
      },
    );
  }

  pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      isLoading = true;
      PlatformFile file = result.files.first;
      pickedFileApp = File('${file.path}');
      isLoading = false;
      update();
    } else {
      Get.snackbar('', "You don't pick a image");
    }
  }

  updateUserPhoto() async {
    isLoading = true;
    await _profileService.updateUserPhoto(
        uid: authStorage.read(Keys.authKey),
        pickedFile: pickedFileApp,
        onError: (e) {
          Get.snackbar('something went wrong', e.toString());
          isLoading = false;
        },
        onDone: () {
          getUserInfo();
          isLoading = false;
          update();
          Get.snackbar('Photo is updated', "");
        });
  }

  signOut() async {
    await _profileService.signOut(
      onError: (String e) {
        Get.snackbar(
          'something went wrong',
          e,
        );
      },
      onDone: () {
        authStorage.remove(Keys.emailKey);
        authStorage.remove(Keys.loginSaveKey);
        Get.offAllNamed(Routes.loginScreen);
      },
    );
  }
}
