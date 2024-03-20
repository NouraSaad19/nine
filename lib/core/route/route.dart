import 'package:flutter_template/feature/authentication/screen/login_screen.dart';
import 'package:flutter_template/feature/home/screen/home_screen.dart';
import 'package:flutter_template/feature/profile/screen/edit_profile_screen.dart';
import 'package:flutter_template/feature/profile/screen/profile_screen.dart';
import 'package:get/get.dart';
import '../../feature/authentication/screen/singup_screen.dart';
import '../../feature/splash/screen/splash_screen.dart';
import '../binding/binding.dart';
import '../binding/splash_binding.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: Routes.splashScreen,
        page: SplashScreen.new,
        binding: SplashBinding(),
        transition: Transition.fade),
    GetPage(
      name: Routes.loginScreen,
      page: LoginScreen.new,
      binding: Binding(),
    ),
    GetPage(
      name: Routes.singUpScreen,
      page: SingUpScreen.new,
      binding: Binding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: ProfileScreen.new,
      binding: Binding(),
    ),
    GetPage(
      name: Routes.editProfileScreen,
      page: EditProfileScreen.new,
      binding: Binding(),
    )
  ];
}

class Routes {
  static const splashScreen = '/splash_screen';
  static const loginScreen = '/login_screen';
  static const singUpScreen = '/singup_screen';
  static const homeScreen = '/home_screen';
  static const profileScreen = '/profile_screen';
  static const editProfileScreen = '/edit_profile_screen';
}
