import 'package:get/get.dart';
import 'package:winkl_project/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:winkl_project/app/modules/home/controllers/home_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(
      DashboardController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavoritesController>(
            () => FavoritesController());
  }
}
