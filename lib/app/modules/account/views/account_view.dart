import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mantools/app/constants/app_colors.dart';
import 'package:mantools/app/constants/app_icons.dart';
import 'package:mantools/app/constants/app_widgets.dart';
import 'package:mantools/app/controllers/auth_controller.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  final authContoller = Get.find<AuthController>();

  void _showDialog(BuildContext context) {
    showBottomDialog(
      context: context,
      allowBackNavigation: true,
      title: 'Apakah Anda Yakin Akan Keluar?',
      content: 'Anda akan diarahkan ke halaman login jika ingin keluar.',
      actions: [
        Row(
          children: [
            Expanded(
              child: MaterialButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                elevation: 0,
                color: Colors.red,
                child: plusJakartaText(
                  "YA, KELUAR",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.white,
                ),
                onPressed: () {
                  Get.back();
                  controller.isLoading.value = true;
                  authContoller
                      .logout(authContoller.userModel?.providers ?? "");
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: MaterialButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                elevation: 0,
                color: AppColors.primaryColor,
                child: plusJakartaText(
                  "TIDAK",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.white,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.primaryTextColor,
          size: 24.0,
        ),
        elevation: 1,
        shadowColor: AppColors.greyBorderColor,
        backgroundColor: Colors.white,
        title: plusJakartaText(
          "Akun",
          textColor: AppColors.primaryTextColor,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 24, 12, 12),
              width: double.infinity,
              alignment: Alignment.center,
              child: AvatarGlow(
                glowColor: AppColors.primaryColor,
                child: Container(
                  width: 175,
                  height: 175,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(87.5),
                    child: authContoller.userModel?.photoUrl == null ||
                            authContoller.userModel!.photoUrl!.isEmpty
                        ? Image.asset(icNoImage)
                        : Image.network(
                            authContoller.userModel?.photoUrl! ?? ""),
                  ),
                ),
                endRadius: 110.0,
              ),
            ),
            plusJakartaText(authContoller.userModel?.name ?? "",
                fontWeight: FontWeight.bold, fontSize: 18.0),
            const SizedBox(
              height: 8,
            ),
            dmSansText(
              authContoller.userModel?.email ?? "",
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              textColor: AppColors.greyColor,
            ),
            const SizedBox(
              height: 16,
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              label: plusJakartaText(
                "Ubah Profil",
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                textColor: Colors.white,
              ),
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.primaryColor),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.fromLTRB(24, 10, 24, 10),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              width: double.infinity,
              color: const Color(0xFFF6F6F6),
              child: plusJakartaText(
                "AKUN & KEAMANAN",
                textColor: const Color(0xFF9B9B9B),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.people,
                color: AppColors.primaryTextColor,
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: AppColors.primaryTextColor,
              ),
              title: plusJakartaText(
                "Informasi Akun",
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                textColor: AppColors.primaryTextColor,
              ),
              horizontalTitleGap: 0,
            ),
            const Divider(
              thickness: 2,
              color: Color(0xFFF6F6F6),
            ),
            ListTile(
              leading: const Icon(
                Icons.privacy_tip,
                color: AppColors.primaryTextColor,
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: AppColors.primaryTextColor,
              ),
              title: plusJakartaText(
                "Password & Keamanan",
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                textColor: AppColors.primaryTextColor,
              ),
              horizontalTitleGap: 0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              width: double.infinity,
              color: const Color(0xFFF6F6F6),
              child: plusJakartaText(
                "INFORMASI",
                textColor: const Color(0xFF9B9B9B),
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              trailing: plusJakartaText(
                "1.0.0",
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                textColor: AppColors.primaryTextColor,
              ),
              title: plusJakartaText(
                "Versi App",
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                textColor: AppColors.primaryTextColor,
              ),
              horizontalTitleGap: 0,
            ),
            const Divider(
              thickness: 2,
              color: Color(0xFFF6F6F6),
            ),
            ListTile(
              trailing: const Icon(
                Icons.chevron_right,
                color: AppColors.primaryTextColor,
              ),
              title: plusJakartaText(
                "Syarat & Ketentuan",
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                textColor: AppColors.primaryTextColor,
              ),
              horizontalTitleGap: 0,
            ),
            const Divider(
              thickness: 2,
              color: Color(0xFFF6F6F6),
            ),
            ListTile(
              trailing: const Icon(
                Icons.chevron_right,
                color: AppColors.primaryTextColor,
              ),
              title: plusJakartaText(
                "Kebijakan Privasi",
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                textColor: AppColors.primaryTextColor,
              ),
              horizontalTitleGap: 0,
            ),
            const Divider(
              thickness: 2,
              color: Color(0xFFF6F6F6),
            ),
            ListTile(
              trailing: const Icon(
                Icons.chevron_right,
                color: AppColors.primaryTextColor,
              ),
              title: plusJakartaText(
                "Tentang Kami",
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                textColor: AppColors.primaryTextColor,
              ),
              horizontalTitleGap: 0,
            ),
            const Divider(
              thickness: 2,
              color: Color(0xFFF6F6F6),
            ),
            Obx(
              () => Container(
                margin: const EdgeInsets.all(20),
                height: 48,
                width: double.infinity,
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor),
                      )
                    : MaterialButton(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        elevation: 0,
                        color: AppColors.primaryColor,
                        child: plusJakartaText(
                          "Logout",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                        ),
                        onPressed: () {
                          _showDialog(context);
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
