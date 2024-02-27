import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassWordWidget extends StatelessWidget {
  const ForgetPassWordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: Get.back,
                icon: const Icon(Icons.arrow_back_ios))),
        body: const Center(child: Text(' forget password ')));
  }
}
