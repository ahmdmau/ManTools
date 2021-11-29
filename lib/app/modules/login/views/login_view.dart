import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mantools/app/routes/app_pages.dart';
import 'package:mantools/app/widgets/custom_button.dart';
import 'package:mantools/app/widgets/custom_text_form_field.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_widgets.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          bottom: kBottomNavigationBarHeight,
          top: kBottomNavigationBarHeight,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            plusJakartaText(
              "MANTOOLS",
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              textColor: AppColors.greyTextBorderColor,
            ),
            const SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () {},
              child: plusJakartaText(
                "v1.0.0",
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                textColor: AppColors.primaryColor,
              ),
            )
          ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      plusJakartaText(
                        "Selamat Datang,",
                        fontSize: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: plusJakartaText(
                          "Daftar",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.primaryColor,
                        ),
                      )
                    ],
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
                    controller: controller.emailController,
                    titleText: 'Email',
                    hintText: 'Masukkan Email Anda',
                    validator: (value) {
                      if (!value!.isEmail) {
                        return "Silahkan masukkan email dengan benar";
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
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: plusJakartaText(
                      "Lupa Kata Sandi?",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    buttonText: "MASUK",
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (controller.formKey.currentState?.validate() ??
                          false) {
                        controller.authController.signInWithEmail(
                            controller.emailController.text,
                            controller.passwordController.text);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: plusJakartaText(
                      "- ATAU -",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      isCentered: true,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  MaterialButton(
                    height: 48.0,
                    elevation: 0,
                    padding: EdgeInsets.all(0),
                    color: Colors.white,
                    onPressed: () {
                      controller.authController.login();
                    },
                    splashColor: Colors.white30,
                    highlightColor: Colors.white30,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    child: Container(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/logos/google.png',
                              height: 24,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            plusJakartaText(
                              "Masuk dengan Google",
                              textColor: Color.fromRGBO(0, 0, 0, 0.54),
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: Color(0xFFF2F2F2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MaterialButton(
                    height: 48.0,
                    elevation: 0,
                    padding: EdgeInsets.all(0),
                    color: Colors.white,
                    onPressed: () {
                      controller.authController.signInWithFacebook();
                    },
                    splashColor: Colors.white30,
                    highlightColor: Colors.white30,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    child: Container(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/logos/facebook.png',
                              height: 24,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            plusJakartaText(
                              "Masuk dengan Facebook",
                              textColor: Color.fromRGBO(0, 0, 0, 0.54),
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: Color(0xFFF2F2F2),
                      ),
                    ),
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
