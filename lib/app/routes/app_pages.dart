import 'package:get/get.dart';

import 'package:winkl_project/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:winkl_project/app/modules/dashboard/views/dashboard_view.dart';
import 'package:winkl_project/app/modules/favorites/bindings/favorites_binding.dart';
import 'package:winkl_project/app/modules/favorites/views/favorites_view.dart';
import 'package:winkl_project/app/modules/home/bindings/home_binding.dart';
import 'package:winkl_project/app/modules/home/views/home_view.dart';
import 'package:winkl_project/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:winkl_project/app/modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => FavoritesView(),
      binding: FavoritesBinding(),
    ),
  ];
}
