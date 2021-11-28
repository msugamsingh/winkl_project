import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winkl_project/app/widgets/my_bottom_navigation_bar.dart';
import 'package:winkl_project/utils/helper/custom_icon.dart';
import 'package:winkl_project/utils/values/strings.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.winklTitle),
        leading: Icon(CustomIcons.menu),
        actions: [
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                Get.defaultDialog(
                  title: Strings.infoLabel,
                  contentPadding: EdgeInsets.all(24),
                  content: Text(
                    Strings.infoContent,
                  ),
                );
              }),
        ],
      ),
      bottomNavigationBar: Obx(
        () => MyBottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.navIndex.value),
      ),
      body: Obx(
        () => controller.buildContentBody(controller.navIndex.value),
      ),
    );
  }
}
