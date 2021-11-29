import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mantools/app/constants/app_colors.dart';
import 'package:mantools/app/constants/app_widgets.dart';
import 'package:mantools/app/routes/app_pages.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: AppColors.primaryColor,
          pages: [
            PageViewModel(
              titleWidget: plusJakartaText(
                "Dapatkan Tukang Professional",
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                isCentered: true,
              ),
              bodyWidget: dmSansText(
                "Tentukan kebutuhanmu dan dapatkan estimasi dalam hitungan menit.",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                isCentered: true,
              ),
              decoration: PageDecoration(
                titlePadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                descriptionPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              ),
              image: Container(
                width: Get.width * 0.7,
                child: Image.asset('assets/icons/w1.png'),
              ),
            ),
            PageViewModel(
              titleWidget: plusJakartaText(
                "Dapatkan Tukang Professional",
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                isCentered: true,
              ),
              bodyWidget: dmSansText(
                "Tentukan kebutuhanmu dan dapatkan estimasi dalam hitungan menit.",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                isCentered: true,
              ),
              decoration: PageDecoration(
                titlePadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                descriptionPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              ),
              image: Container(
                width: Get.width * 0.7,
                child: Image.asset('assets/icons/w2.png'),
              ),
            ),
            PageViewModel(
              titleWidget: plusJakartaText(
                "Dapatkan Tukang Professional",
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                isCentered: true,
              ),
              bodyWidget: dmSansText(
                "Tentukan kebutuhanmu dan dapatkan estimasi dalam hitungan menit.",
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                isCentered: true,
              ),
              decoration: PageDecoration(
                titlePadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                descriptionPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              ),
              image: Container(
                width: Get.width * 0.7,
                child: Image.asset('assets/icons/w3.png'),
              ),
            ),
          ],
          onDone: () {
            Get.offAllNamed(Routes.LOGIN);
          },
          onSkip: () {
            Get.offAllNamed(Routes.LOGIN);
          },
          showSkipButton: true,
          skip: plusJakartaText("Lewati",
              fontSize: 14.0, fontWeight: FontWeight.bold),
          next: plusJakartaText("Selanjutnya",
              fontSize: 14.0, fontWeight: FontWeight.bold),
          done: plusJakartaText("Selesai",
              fontSize: 14.0, fontWeight: FontWeight.bold),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              color: Colors.black26,
              activeColor: AppColors.primaryTextColor,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}
