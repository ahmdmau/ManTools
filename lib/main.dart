import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mantools/app/controllers/auth_controller.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              title: "ManTools",
              initialRoute: authController.isSkipIntro.isTrue
                  ? authController.isAuthenticated.isTrue
                      ? Routes.MAIN
                      : Routes.LOGIN
                  : Routes.INTRODUCTION,
              getPages: AppPages.routes,
            ),
          );
        }
        return FutureBuilder(
          future: authController.firstInitialized(),
          builder: (context, snapshot) {
            return SplashScreen();
          },
        );
      },
    );
  }
}
