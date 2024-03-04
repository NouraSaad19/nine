import 'package:flutter/material.dart';
import 'package:flutter_template/common/widget/text_field_widget.dart';
import 'package:flutter_template/core/theme/app_colors.dart';
import 'package:flutter_template/feature/profile/controller/profile_controller.dart';


class EditUserNameWidget extends StatelessWidget {
  const EditUserNameWidget({super.key, required this.profileController});
  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 200,
            height: 50,
            child: Material(
              elevation: 10,
              shadowColor: AppColor.greyColor.shade300,
              child: TextFieldWidget(
                controller: profileController.nameController,
                hintText: 'الاسم',
              ),
            ),
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
    );
  }
}
