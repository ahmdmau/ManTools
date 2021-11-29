import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/account/views/account_view.dart';
import '../../../modules/home/views/home_view.dart';
import '../../../modules/order/views/order_view.dart';

class MainController extends GetxController {
  List<Widget> mainPages = [HomeView(), OrderView(), AccountView()];
  int selectedIndex = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void setSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }
}
