import 'package:flutter/material.dart';
import 'package:flutter_template/feature/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Padding(
        padding: const EdgeInsets.only(right: 80),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  profileController.nameController.text,
                  style: textTheme.labelMedium,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  ' الاسم',
                  style: textTheme.labelMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  profileController.emailController.text,
                  style: textTheme.labelMedium,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  ' الايميل',
                  style: textTheme.labelMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'مبرمجة',
                  style: textTheme.labelMedium,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  ' العمل',
                  style: textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}