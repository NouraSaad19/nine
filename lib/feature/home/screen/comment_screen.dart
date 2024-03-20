import 'package:flutter/material.dart';
import 'package:flutter_template/feature/home/widget/comment_widget/comment_list_widget.dart';
import 'package:get/get.dart';
import '../../profile/widget/icon_widget.dart';
import '../controller/comment_controller.dart';
import '../controller/post_controller.dart';
import '../model/post_model.dart';
import '../widget/comment_widget/post_comment_widget.dart';
import '../widget/comment_widget/reply_widget.dart';

class CommentScreen extends StatelessWidget {
  final PostModel post;
  final PostController postController;
  const CommentScreen({
    super.key,
    required this.post,
    required this.postController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'الردود',
          style: textTheme.headlineLarge,
        ),
        toolbarHeight: 100,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: IconWidget(
              onPressed: () {
                Get.back();
              },
              icon: Icons.arrow_forward_ios_outlined,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: GetBuilder<CommentController>(builder: (commentController) {
            return Column(
              children: [
                const SizedBox(
                  width: 70,
                ),
                const SizedBox(
                  height: 37,
                ),
                PostCommentWidget(
                  post: post,
                ),
                const CommentListWidget(),
                const SizedBox(height: 10,),

                 ReplyWidget(post:post),
              ],
            );
          }),
        ),
      ),
    );
  }
}
