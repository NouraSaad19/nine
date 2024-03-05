import 'package:flutter/material.dart';
import 'package:flutter_template/core/constant/app_image.dart';
import 'package:flutter_template/feature/home/widget/post_card_widget.dart';
import 'package:get/get.dart';
import '../../../common/widget/logo_home_widget.dart';
import '../../../core/route/route.dart';
import '../../profile/controller/profile_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const Center(
          child: Text(''),
        ),
        toolbarHeight: 100,
        title: const LogoHomeWidget(),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.profileScreen);
            },
            child: GetBuilder<ProfileController>(builder: (profileController) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: profileController.profilePhoto == null ||
                            profileController.profilePhoto!.isEmpty
                        ? AssetImage(AppImage.profilePhotoImage)
                            as ImageProvider
                        : NetworkImage(
                            profileController.profilePhoto ?? "",
                          ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ],
      ),

      body: Center(
        child: Column(
          children: [
            //  const LogoHomeWidget(),
            Center(
              child: Text('مجلس تسعة ',
                  textAlign: TextAlign.center, style: textTheme.headlineLarge),
            ),
            const SizedBox(
              width: 70,
            ),
            const SizedBox(
              height: 37,
            ),
            const PostCardWidget(),
          ],
        ),
      ),
      //   ),
    );
  }
}
