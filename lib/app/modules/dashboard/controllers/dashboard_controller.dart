import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winkl_project/app/modules/favorites/views/favorites_view.dart';
import 'package:winkl_project/app/modules/home/views/home_view.dart';

class DashboardController extends GetxController {
  final navIndex = 0.obs;

  Widget buildContentBody(int i) {
    switch (i) {
      case 0:
        {
          return HomeView();
        }
      case 1:
        {
          return FavoritesView();
        }

      default:
        {
          return HomeView();
        }
    }
  }

  void changeTabIndex(int i) {
    navIndex.value = i;
  }

  @override
  void onClose() {
    navIndex.value = 0;
  }
}
