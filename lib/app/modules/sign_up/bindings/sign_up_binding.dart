import 'package:get/get.dart';

import '../../login/controllers/login_controller.dart';
import '../controllers/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
