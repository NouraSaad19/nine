import 'package:flutter/material.dart';
import 'package:flutter_template/feature/home/controller/comment_controller.dart';
import 'package:flutter_template/feature/home/model/post_model.dart';
import 'package:flutter_template/feature/home/widget/comment_widget/write_comment_widget.dart';
import 'package:get/get.dart';

class ReplyWidget extends StatelessWidget {
  final PostModel post;
  const ReplyWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<CommentController>(builder: (commentController) {
      return GestureDetector(
        onTap: () {
          Get.back();
          Get.bottomSheet(
            ignoreSafeArea: false,
            isScrollControlled: true,
            WriteCommentWidget(
              post: post,
            ),
          );
        },
        child: TextFormField(
          controller: commentController.commentTextEditingController,
          maxLines: 4,
          decoration: const InputDecoration(
            hintText: 'شاركنا رايك ',
            border: InputBorder.none,
          ),
          style: textTheme.bodyMedium,
          textAlign: TextAlign.right,
        ),
      );
    });
  }
}
