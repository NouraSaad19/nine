import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_image.dart';
import '../../../../core/route/route.dart';
import '../../../profile/controller/profile_controller.dart';
import '../../controller/post_controller.dart';
import 'footer_widget.dart';
import 'header_widget.dart';

class WritePostWidget extends StatelessWidget {
  WritePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<PostController>(
      builder: (postController) {
        return GetBuilder<ProfileController>(
          builder: (profileController) {
            return Container(
              height: 772,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: AppColor.greyBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const HeaderWritePostWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.profileScreen);
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: profileController.profilePhoto == null ||
                                      profileController.profilePhoto!.isEmpty
                                  ? AssetImage(AppImage.profilePhotoImage)
                                      as ImageProvider
                                  : NetworkImage(
                                      FirebaseAuth
                                              .instance.currentUser?.photoURL ??
                                          '',
                                    ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          FirebaseAuth.instance.currentUser?.displayName ?? '',
                          style: textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 358,
                    height: 450,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.72, -0.70),
                        end: Alignment(-0.72, 0.7),
                        colors: [Color(0xFFEEF0F5), Color(0xFFE6E9EF)],
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 0.50, color: AppColor.logoShadowCloudColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: [
                        BoxShadow(
                          color: (AppColor.logoGreyColor),
                          blurRadius: 24,
                          offset: const Offset(10, 10),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: (AppColor.logoSnowColor),
                          blurRadius: 20,
                          offset: const Offset(-12, -12),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller:
                                postController.postTextEditingController,
                            maxLines: 6,
                            decoration: const InputDecoration(
                              hintText:
                                  'لا تشيل هم اكتب لنا سواليف حتى لو انها بيض',
                              border: InputBorder.none,
                            ),
                            style: textTheme.bodyMedium,
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(height: 16),
                          if (profileController.pickedFileApp != null)
                            Image.file(
                              profileController.pickedFileApp!,
                              height: 150,
                            ),
                        ],
                      ),
                    ),
                  ),
                  const FooterWritePostWidget(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
