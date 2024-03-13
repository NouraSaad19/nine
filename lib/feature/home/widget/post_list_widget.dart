import 'package:flutter/widgets.dart';
import 'package:flutter_template/feature/home/controller/post_controller.dart';
import 'package:flutter_template/feature/home/widget/post_card_widget.dart';
import 'package:get/get.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(builder: (controller) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.posts.length,
        itemBuilder: ((context, index) {
          return PostCardWidget(post: controller.posts[index],);
        }),
      );
    });
  }
}
