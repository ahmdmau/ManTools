import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mantools/app/controllers/auth_controller.dart';

class RegisterController extends GetxController {
  final authController = Get.find<AuthController>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController repeatPasswordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.onClose();
  }
}
