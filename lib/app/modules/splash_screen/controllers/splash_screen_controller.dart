import 'package:get/get.dart';
import 'package:winkl_project/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    _startOnboarding();
  }

  void _startOnboarding() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAndToNamed(Routes.DASHBOARD);
  }
}
