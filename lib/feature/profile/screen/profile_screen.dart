import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/core/constant/app_image.dart';
import 'package:flutter_template/core/route/route.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/feature/profile/controller/profile_controller.dart';
import 'package:flutter_template/feature/profile/widget/icon_widget.dart';
import 'package:flutter_template/feature/profile/widget/personal_information_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconWidget(
                onPressed: () {
                  Get.offNamed(Routes.homeScreen);
                },
                icon: Icons.home_outlined,
              ),
              const SizedBox(
                width: 100,
              ),
              Text(
                'الصفحة الشخصية',
                style: textTheme.headlineMedium,
              ),
            ],
          ),
          toolbarHeight: 100,
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: IconWidget(
                onPressed: () {
                  Get.offNamed(Routes.editProfileScreen);
                },
                icon: Icons.edit_outlined,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 57,
                ),
                // profileController.isLoading
                //     ? Container(
                //         height: 100,
                //         width: 100,
                //         decoration: BoxDecoration(
                //           color: Colors.amber,
                //           shape: BoxShape.circle,
                //           image: DecorationImage(
                //             image: AssetImage(AppImage.logoImage),
                //             fit: BoxFit.fill,
                //           ),
                //         ),
                //       )
                //     :
                Container(
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
                Center(
                    child: PersonalInformationWidget(
                  profileController: profileController,
                )),
                const SizedBox(
                  height: 100,
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
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        height: 100, child: Image.asset(AppImage.groupImage))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
