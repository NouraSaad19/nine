import 'package:flutter/material.dart';
import 'package:flutter_template/feature/profile/widget/icon_widget.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../profile/controller/profile_controller.dart';
import '../../controller/post_controller.dart';

class HeaderWritePostWidget extends StatelessWidget {
  final String header;

  const HeaderWritePostWidget({super.key, required this.header});

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
                  IconWidget(
                    onPressed: () {
                      postController.clearController();
                      profileController.clearPickedFile();
                      Get.back();
                    },
                    icon: Icons.close,
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Center(
                    child: Text(
                      header,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineLarge,
                    ),
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
