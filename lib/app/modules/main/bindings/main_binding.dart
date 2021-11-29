import 'package:get/get.dart';
import 'package:mantools/app/modules/account/controllers/account_controller.dart';
import 'package:mantools/app/modules/home/controllers/home_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
  }
}
