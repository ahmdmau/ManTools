import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mantools/app/constants/app_colors.dart';
import 'package:mantools/app/constants/app_widgets.dart';
import 'package:mantools/app/widgets/custom_button.dart';
import 'package:mantools/app/widgets/custom_text_form_field.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.primaryTextColor,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  plusJakartaText(
                    "Mendaftar,",
                    fontSize: 30,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  dmSansText(
                    "Cari & Dapatkan tukang professional sesuai kebutuhan Anda!",
                    fontSize: 16.0,
                    textColor: Colors.grey,
                    isCentered: false,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextFormField(
                    controller: controller.nameController,
                    titleText: 'Nama Lengkap',
                    hintText: 'Masukkan Nama Lengkap Anda',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Masukkan nama dengan benar";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextFormField(
                    controller: controller.emailController,
                    titleText: 'Email',
                    hintText: 'Masukkan Email Anda',
                    validator: (value) {
                      if (!value!.isEmail) {
                        return "Masukkan email dengan benar";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextFormField(
                    controller: controller.passwordController,
                    titleText: 'Password',
                    hintText: 'Masukkan Password Anda',
                    isObscureText: true,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 8) {
                        return "Password minimal 8 karakter";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextFormField(
                    controller: controller.repeatPasswordController,
                    titleText: 'Ulangi Password',
                    hintText: 'Ulangi Password Anda',
                    isObscureText: true,
                    validator: (value) {
                      if (value! != controller.passwordController.text) {
                        return "Konfirmasi password tidak sama";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  CustomButton(
                    buttonText: "MASUK",
                    onPressed: () {
                      controller.formKey.currentState?.save();
                      if (controller.formKey.currentState?.validate() ??
                          false) {
                        controller.authController.signUpWithEmail(
                          controller.nameController.text,
                          controller.emailController.text,
                          controller.passwordController.text,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
