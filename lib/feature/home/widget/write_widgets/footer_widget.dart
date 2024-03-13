import 'package:flutter/material.dart';
import 'package:flutter_template/feature/profile/controller/profile_controller.dart';
import 'package:get/get.dart';
import '../../../../core/constant/keys.dart';
import '../../../../core/theme/app_colors.dart';
import '../../controller/post_controller.dart';
import '../../model/post_model.dart';

class FooterWritePostWidget extends StatelessWidget {
  const FooterWritePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<PostController>(
      builder: (postController) {
        return GetBuilder<ProfileController>(
          builder: (profileController) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(0.72, -0.70),
                        end: const Alignment(-0.72, 0.7),
                        colors: [
                          AppColor.logoShadowWhiteColor,
                          AppColor.logoShadowCreamColor
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 0.50, color: AppColor.logoShadowCloudColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      shadows: [
                        BoxShadow(
                          color: (AppColor.logoGreyColor),
                          blurRadius: 20,
                          offset: const Offset(6, 6),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: (AppColor.logoGreyColor),
                          blurRadius: 20,
                          offset: const Offset(-6, -6),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        await profileController.pickImage();
                      },
                      icon: Icon(
                        Icons.image_outlined,
                        color: AppColor.tiffanyColor,
                        size: 24.0,
                      ),
                      color: AppColor.tiffanyColor,
                      highlightColor: AppColor.whiteColor,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 35),
                    ),
                    onPressed: () {
                      final String postText =
                          postController.postTextEditingController.text;
                      if (postText.isNotEmpty) {
                        String? imagePath =
                            profileController.pickedFileApp?.path;

                        postController.addPost(
                          PostModel(
                            uid: postController.authStorage.read(Keys.authKey),
                            content: postText,
                            imageUrl: imagePath,
                          ),
                          pickedFile: profileController.pickedFileApp,
                        );
                        postController.clearController();
                        profileController.clearPickedFile();
                        Get.back();
                      }
                    },
                    child: Text('مشاركة', style: textTheme.displayMedium),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
