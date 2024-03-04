import 'package:flutter/material.dart';
import 'package:flutter_template/core/constant/app_image.dart';
import 'package:flutter_template/core/route/route.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/feature/profile/controller/profile_controller.dart';
import 'package:flutter_template/feature/profile/widget/personal_information_widget.dart';
import 'package:flutter_template/feature/profile/widget/profile_header_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeaderWidget(
                title: 'الصفحة الشخصية',
                onPressed: () {
                  Get.offNamed(Routes.editProfileScreen);
                },
                icon: Icons.edit_outlined,
              ),
              const SizedBox(
                height: 57,
              ),
              profileController.isLoading
                  ? Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber,
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
              const SizedBox(
                height: 29,
              ),
              const Center(child: PersonalInformationWidget()),
              const SizedBox(
                height: 134,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32, left: 20),
                child: ElevatedButton(
                  onPressed: profileController.signOut,
                  child: Text(
                    'تسجيل الخروج',
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
