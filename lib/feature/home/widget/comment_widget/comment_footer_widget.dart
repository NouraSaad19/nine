import 'package:flutter/material.dart';
import 'package:flutter_template/feature/home/controller/comment_controller.dart';
import 'package:flutter_template/feature/home/model/comment_model.dart';
import 'package:flutter_template/feature/profile/controller/profile_controller.dart';
import 'package:get/get.dart';
import '../../../../core/constant/keys.dart';
import '../../model/post_model.dart';

class FooterCommentPostWidget extends StatelessWidget {
  final PostModel post;

  const FooterCommentPostWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GetBuilder<CommentController>(builder: (commentController) {
      return GetBuilder<ProfileController>(
        builder: (profileController) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 35),
                  ),
                  onPressed: () async {
                    final String commentText =
                        commentController.commentTextEditingController.text;
                    print("${post.postId!} post id ");
                    if (commentText.isNotEmpty) {
                      await commentController.addCommentToPost(
                        post: post,
                        comment: CommentModel(
                          uid: commentController.authStorage.read(Keys.authKey),
                          commentContent: commentText,
                          postId: post.postId!,
                        ),
                      );
                      commentController.clearController();
                      Get.back();
                      // fetch data
                      await commentController
                          .fetchCommentsForPost(post.postId!);
                    }
                  },
                  child: Text('الرد', style: textTheme.displayMedium),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
