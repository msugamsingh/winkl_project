import 'package:get/get.dart';
import 'package:winkl_project/app/modules/favorites/controllers/collection_controller.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.put(CollectionController(), permanent: true);
  }
}
