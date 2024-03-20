import 'package:flutter/material.dart';
import 'package:flutter_template/feature/home/widget/comment_widget/write_comment_widget.dart';
import 'package:get/get.dart';
import '../../../profile/widget/icon_widget.dart';
import '../../model/post_model.dart';

class IconsWidget extends StatelessWidget {
  final PostModel post;

  const IconsWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 19),
        IconWidget(
          onPressed: () {},
          icon: Icons.favorite_border,
        ),
        const SizedBox(width: 14),
        IconWidget(
          onPressed: () {
            Get.back();
            Get.bottomSheet(
              ignoreSafeArea: false,
              isScrollControlled: true,
              WriteCommentWidget(
                post: post,
              ),
            );
          },
          icon: Icons.mode_comment_outlined,
        ),
      ],
    );
  }
}
