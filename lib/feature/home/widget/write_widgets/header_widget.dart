import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../profile/controller/profile_controller.dart';
import '../../controller/post_controller.dart';

class HeaderWritePostWidget extends StatelessWidget {
  const HeaderWritePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<PostController>(
      builder: (postController) {
        return GetBuilder<ProfileController>(
          builder: (profileController) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
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
                          color: AppColor.logoGreyColor,
                          blurRadius: 20,
                          offset: const Offset(6, 6),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: AppColor.logoGreyColor,
                          blurRadius: 20,
                          offset: const Offset(-6, -6),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        postController.clearController();
                        profileController.clearPickedFile();
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        color: AppColor.tiffanyColor,
                        size: 24.0,
                      ),
                      color: AppColor.tiffanyColor,
                      highlightColor: AppColor.whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Text(
                    'شاركنا سواليفك ',
                    textAlign: TextAlign.center,
                    style: textTheme.headlineLarge,
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
