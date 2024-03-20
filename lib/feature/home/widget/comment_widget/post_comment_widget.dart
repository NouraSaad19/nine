import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/post_model.dart';
import '../post_widgets/icons_widget.dart';

class PostCommentWidget extends StatelessWidget {
  final PostModel post;

  const PostCommentWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 380,
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
          side: BorderSide(width: 0.50, color: AppColor.logoShadowCloudColor),
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
                  FirebaseAuth.instance.currentUser?.photoURL ?? '',
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 100,
                height: 23,
                child: Text(
                  FirebaseAuth.instance.currentUser?.displayName ??
                      'Default Name',
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
                width: 350,
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
    );
  }
}
