import 'package:assisto/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../theme/theme.dart';

class HomeController extends GetxController {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  
  AuthController ac = Get.find();
  late String empId;
  late String name;
  String homeViewFont = Theme_.aFontFamilyAlt;
  int contactCount = 172;

  @override
  void onInit() {
    super.onInit();
    name = (ac.user_!.firstName ?? '') + " " + (ac.user_!.lastName ?? '');
    empId = ac.user_!.id?.substring(0, 5)??'HJY78';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
