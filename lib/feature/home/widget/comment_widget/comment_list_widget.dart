import 'package:flutter/material.dart';
import 'package:flutter_template/feature/home/controller/comment_controller.dart';
import 'package:flutter_template/feature/home/widget/comment_widget/comment_card_widget.dart';
import 'package:get/get.dart';

class CommentListWidget extends StatelessWidget {
  const CommentListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(builder: (commentController) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: commentController.comments.length,
        itemBuilder: ((context, index) {
          return CommentCardWidget(comment: commentController.comments[index]);
        }),
      );
    });
  }
}
