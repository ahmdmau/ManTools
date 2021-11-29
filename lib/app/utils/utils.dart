import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mantools/app/constants/app_colors.dart';
import 'package:mantools/app/constants/app_widgets.dart';

class Utils {
  Utils._();

  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 16,
              ),
              plusJakartaText(
                message ?? "",
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              )
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }

  static showSnackBar(String title, String message, bool isError) {
    if (Get.isSnackbarOpen! || Get.isDialogOpen!) Get.back();
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: isError ? Colors.red : AppColors.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
