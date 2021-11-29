import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mantools/app/constants/app_colors.dart';
import 'package:mantools/app/constants/app_icons.dart';

import '../controllers/main_controller.dart';
import '../../../modules/account/views/account_view.dart';
import '../../../modules/home/views/home_view.dart';
import '../../../modules/order/views/order_view.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: buildBottomNav(controller),
          body: IndexedStack(
            index: controller.selectedIndex,
            children: [HomeView(), OrderView(), AccountView()],
          ),
        );
      },
    );
  }

  BottomNavigationBar buildBottomNav(MainController controller) {
    return BottomNavigationBar(
      currentIndex: controller.selectedIndex,
      onTap: controller.setSelectedIndex,
      backgroundColor: Colors.white,
      selectedFontSize: 14.0,
      selectedItemColor: AppColors.primaryColor,
      selectedLabelStyle: const TextStyle(
        color: AppColors.primaryColor,
        fontFamily: "PlusJakartaSans",
      ),
      unselectedFontSize: 14.0,
      unselectedItemColor: AppColors.greyColor,
      unselectedLabelStyle: const TextStyle(
        color: AppColors.greyColor,
        fontFamily: "PlusJakartaSans",
      ),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            controller.selectedIndex == 0 ? icHomeSelected : icHome,
            height: 24,
          ),
          label: "Beranda",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            controller.selectedIndex == 1 ? icOrderSelected : icOrder,
            height: 24,
          ),
          label: "Pesanan",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            controller.selectedIndex == 2 ? icAccountSelected : icAccount,
            height: 24,
          ),
          label: "Akun",
        ),
      ],
    );
  }
}
