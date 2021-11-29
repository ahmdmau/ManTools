import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mantools/app/controllers/auth_controller.dart';

class LoginController extends GetxController {
  final authController = Get.find<AuthController>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
