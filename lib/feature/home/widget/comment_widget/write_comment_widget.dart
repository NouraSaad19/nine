import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/feature/home/controller/comment_controller.dart';
import 'package:get/get.dart';
import '../../../../core/constant/app_image.dart';
import '../../../../core/route/route.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../profile/controller/profile_controller.dart';
import '../../model/post_model.dart';
import '../post_widgets/header_widget.dart';
import 'comment_footer_widget.dart';

class WriteCommentWidget extends StatelessWidget {
  final PostModel post;
  const WriteCommentWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<CommentController>(
      builder: (commentController) {
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
                  const HeaderWritePostWidget(
                    header: 'شاركنا وجهة نظرك ',
                  ),
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
                                      profileController.profilePhoto!),
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
                                commentController.commentTextEditingController,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              hintText:
                                  'لا تشيل هم اكتب لنا وجهة نظرك حتى لو محد اقتنع فيها ',
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
                  FooterCommentPostWidget(post: post),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
