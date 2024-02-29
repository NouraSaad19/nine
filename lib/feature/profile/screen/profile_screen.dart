import 'package:flutter/material.dart';
import 'package:flutter_template/feature/profile/controller/profile_controller.dart';
import 'package:flutter_template/feature/profile/widget/personal_information_widget.dart';
import 'package:flutter_template/feature/profile/widget/profile_header_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 90, right: 32, left: 20),
          child: Column(
            children: [
              const ProfileHeaderWidget(),
              const SizedBox(
                height: 57,
              ),
              // const SizedBox(
              //   height: 150,
              //   width: 150,
              //   child: CircleAvatar(
              //     radius:
              //         23, // This radius is the radius of the picture in the circle avatar itself.
              //     backgroundImage: NetworkImage(
              //       'INSERT_YOUR_URL_HERE',
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 29,
              ),
              const PersonalInformationWidget(),
              const SizedBox(
                height: 134,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'تسجيل الخروج',
                  style: textTheme.displayLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
