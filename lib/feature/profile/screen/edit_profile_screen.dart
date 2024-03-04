import 'package:flutter/material.dart';
import 'package:flutter_template/core/constant/app_image.dart';
import 'package:flutter_template/core/route/route.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/feature/profile/controller/profile_controller.dart';
import 'package:flutter_template/feature/profile/widget/edit_user_name_widget.dart';
import 'package:flutter_template/feature/profile/widget/profile_header_widget.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  //final profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeaderWidget(
                title: 'تعديل الصفحة الشخصية',
                onPressed: () {
                  Get.toNamed(Routes.profileScreen);
                },
                icon: Icons.arrow_forward_ios_outlined,
              ),
              const SizedBox(
                height: 57,
              ),
              Stack(children: [
                profileController.isLoading
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImage.logoImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: profileController.profilePhoto == null
                                ? AssetImage(AppImage.profilePhotoImage)
                                    as ImageProvider
                                : NetworkImage(
                                    profileController.profilePhoto!,
                                  ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                Positioned(
                    top: 110,
                    left: 120,
                    child: InkWell(
                      onTap: () async {
                        await profileController.pickImage();
                        // await profileController.updateUserPhoto();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.flip_camera_ios_outlined,
                          color: AppColor.tiffanyColor,
                          size: 18,
                        ),
                      ),
                    )),
              ]),
              const SizedBox(
                height: 29,
              ),
              EditUserNameWidget(
                profileController: profileController,
              ),
              const SizedBox(
                height: 134,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32, left: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    await profileController.updateUserPhoto();
                    await profileController.updateUserName(
                        userName: profileController.nameController.text);
                  },
                  child: Text(
                    'حفظ',
                    style: textTheme.displayLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
