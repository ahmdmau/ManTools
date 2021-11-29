import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mantools/app/constants/app_colors.dart';
import 'package:mantools/app/constants/app_widgets.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: plusJakartaText("Hi, Ahmad Maulana",
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          plusJakartaText("Selamat Datang di",
                              fontSize: 20, fontWeight: FontWeight.normal),
                          const SizedBox(
                            width: 4,
                          ),
                          plusJakartaText("MANTOOLS",
                              fontSize: 20, fontWeight: FontWeight.bold)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: CarouselSlider(
                        carouselController: controller.carouselController,
                        options: CarouselOptions(
                            height: 170,
                            viewportFraction: 1,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              controller.changeSlide(index);
                            }
                            // enlargeCenterPage: true,
                            ),
                        items: controller.banners
                            .map(
                              (item) => ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: item,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.banners.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => controller.carouselController
                              .animateToPage(entry.key),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.currentSliderImageIndex ==
                                      entry.key
                                  ? AppColors.primaryColor
                                  : const Color(0xFFFFE9A9),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: plusJakartaText(
                        "Cari Pekerja",
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: controller.menus.map((e) {
                          return GestureDetector(
                            onTap: () => {},
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x1030260B),
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    e.icon!,
                                    height: 40.0,
                                    width: 40.0,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  plusJakartaText(
                                    e.name!,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
