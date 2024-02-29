import 'package:flutter_template/feature/profile/controller/profile_controller.dart';
import 'package:get/get.dart';
import '../../feature/authentication/controller/auth_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => ProfileController());
  }
}
