import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../profile/controller/profile_controller.dart';
import '../../../profile/service/profile_service.dart';
import '../../controller/comment_controller.dart';
import '../../controller/post_controller.dart';
import '../../model/post_model.dart';
import '../../screen/comment_screen.dart';
import 'icons_widget.dart';

class PostCardWidget extends StatelessWidget {
  final PostModel post;
  final PostController postController;
  final ProfileService profileService = ProfileService();
  final ProfileController profileController = Get.find<ProfileController>();

   PostCardWidget({
    required this.post,
    super.key,
    required this.postController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<CommentController>(builder: (commentController) {
      return GestureDetector(
        onTap: () {
          commentController.fetchCommentsForPost(post.postId!);
          Get.to(CommentScreen(
            post: post,
            postController: postController,
          ));
        },
        child: SingleChildScrollView(
          child: Card(
            elevation: 0.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Container(
              width: 358,
              height: 300,
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
                    blurRadius: 24,
                    offset: const Offset(10, 10),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: AppColor.logoSnowColor,
                    blurRadius: 20,
                    offset: const Offset(-12, -12),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(width: 16),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          post.uid.isEmpty ? '' : profileController.profilePhoto ?? '',
                         // FirebaseAuth.instance.currentUser?.photoURL ?? '',
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 100,
                        height: 23,
                        child: Text(
                         // post.uid.isEmpty ? 'Unknown' : profileController.nameController.text,
                         post.uid ,
                          // FirebaseAuth.instance.currentUser?.displayName ??
                          //     'Default Name',
                          // post.name,
                          textAlign: TextAlign.left,
                          style: textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 86,
                        width: 380,
                        child: Text(
                          post.content,
                          style: textTheme.bodyMedium,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  Image.network(
                    post.imageUrl!,
                    height: 120,
                    width: 100,
                  ),
                  IconsWidget(
                    post: post,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}


