import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/text_field_widget.dart';
import '../controller/auth_controller.dart';

class ForgetPassWordWidget extends StatelessWidget {
  const ForgetPassWordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController();
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: Get.back, icon: const Icon(Icons.arrow_back_ios))),
        body: const Center(child: Text("كلمة المرور ")));
  }
}
