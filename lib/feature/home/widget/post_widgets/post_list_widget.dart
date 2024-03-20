import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/feature/home/controller/post_controller.dart';
import 'package:flutter_template/feature/home/widget/post_widgets/post_card_widget.dart';
import 'package:get/get.dart';
import '../../model/post_model.dart';

class PostListWidget extends StatelessWidget {
  final PostModel? post;
  const PostListWidget({
    super.key,
    this.post,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(builder: (postController) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: postController.posts.length,
        itemBuilder: ((context, index) {
          return PostCardWidget(
            post: postController.posts[index],
            postController: postController,
          );
        }),
      );
    });
  }
}
