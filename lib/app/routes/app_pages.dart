import 'package:get/get.dart';

import 'package:mantools/app/modules/account/bindings/account_binding.dart';
import 'package:mantools/app/modules/account/views/account_view.dart';
import 'package:mantools/app/modules/home/bindings/home_binding.dart';
import 'package:mantools/app/modules/home/views/home_view.dart';
import 'package:mantools/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:mantools/app/modules/introduction/views/introduction_view.dart';
import 'package:mantools/app/modules/login/bindings/login_binding.dart';
import 'package:mantools/app/modules/login/views/login_view.dart';
import 'package:mantools/app/modules/main/bindings/main_binding.dart';
import 'package:mantools/app/modules/main/views/main_view.dart';
import 'package:mantools/app/modules/order/bindings/order_binding.dart';
import 'package:mantools/app/modules/order/views/order_view.dart';
import 'package:mantools/app/modules/register/bindings/register_binding.dart';
import 'package:mantools/app/modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
