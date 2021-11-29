import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:mantools/app/constants/app_icons.dart';
import 'package:mantools/app/modules/home/menu_model.dart';

class HomeController extends GetxController {
  List<Menu> menus = [
    Menu(id: 1, name: "Arsitektur", icon: icArchitect),
    Menu(id: 1, name: "Kontraktor", icon: icContractor),
    Menu(id: 1, name: "Tukang", icon: icBuilder),
    Menu(id: 1, name: "Surveyor", icon: icSurveyor),
    Menu(id: 1, name: "Laboratorium", icon: icLab),
    Menu(id: 1, name: "GeoTeknik", icon: icGeo),
  ];
  List<String> banners = [
    "https://images.unsplash.com/photo-1581094488379-6a10d04c0f04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2370&q=80",
    "https://images.unsplash.com/photo-1581093806997-124204d9fa9d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2340&q=80",
    "https://images.unsplash.com/photo-1610081339709-d86503fcaf15?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2832&q=80"
  ];

  int currentSliderImageIndex = 0;
  final CarouselController carouselController = CarouselController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void changeSlide(int index) {
    currentSliderImageIndex = index;
    update();
  }
}
