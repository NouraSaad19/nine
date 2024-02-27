import 'package:flutter_template/feature/authentication/screen/login_screen.dart';
import 'package:flutter_template/feature/authentication/screen/singup_screen.dart';
import 'package:get/get.dart';
import '../../feature/splash/screen/splash_screen.dart';
import '../binding/binding.dart';
import '../binding/splash_binding.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: SplashScreen.new,
      binding: SplashBinding(),
    ),
    GetPage(
        name: Routes.loginScreen,
        page: LoginScreen.new,
        binding: Binding(),
        transition: Transition.fade),
    GetPage(
      name: Routes.singUpScreen,
      page: SingUpScreen.new,
      binding: Binding(),
    ),
  ];
}

class Routes {
  static const splashScreen = '/splash_screen';
  static const loginScreen = '/login_screen';
  static const singUpScreen = '/singup_screen';
}
