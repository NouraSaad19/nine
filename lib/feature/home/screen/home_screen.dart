import 'package:flutter/material.dart';
import 'package:flutter_template/feature/home/widget/post_card_widget.dart';
import '../../../common/widget/logo_home_widget.dart';
import '../../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        focusColor: AppColor.orangeColor,
        onPressed: () {},
        child: const Icon(Icons.post_add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
            ),
            const Center(child: LogoHomeWidget()),
            Text('مجلس تسعة ',
                textAlign: TextAlign.center, style: textTheme.headlineLarge),
            const SizedBox(
              height: 37,
            ),
            const PostCardWidget(),
          ],
        ),
      ),
    );
  }
}
