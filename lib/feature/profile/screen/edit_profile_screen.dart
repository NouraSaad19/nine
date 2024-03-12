import 'package:flutter/material.dart';
import 'package:flutter_template/core/constant/app_image.dart';
import 'package:flutter_template/core/route/route.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/feature/profile/controller/profile_controller.dart';
import 'package:flutter_template/feature/profile/widget/edit_user_name_widget.dart';
import 'package:flutter_template/feature/profile/widget/icon_widget.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'تعديل الصفحة الشخصية',
            style: textTheme.headlineMedium,
          ),
          toolbarHeight: 100,
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: IconWidget(
                onPressed: () {
                  Get.toNamed(Routes.profileScreen);
                },
                icon: Icons.arrow_forward_ios_outlined,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 57,
              ),
              Stack(children: [
                profileController.isLoading
                    ? SizedBox(
                        height: 150,
                        width: 150,
                        child: Lottie.asset('assets/images/loading.json'),
                      )
                    : Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
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
                        await profileController.updateUserPhoto();
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
                    await profileController.updateUserName(
                        userName: profileController.nameController.text);
                  },
                  child: Text(
                    'حفظ',
                    style: textTheme.displayLarge,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 100, child: Image.asset(AppImage.groupImage))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
