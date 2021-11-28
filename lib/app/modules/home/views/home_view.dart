import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:winkl_project/app/widgets/post_frame_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        child: Obx(
          () => controller.posts.isNotEmpty
              ? Obx(
                  () => InViewNotifierList(
                    itemCount: controller.posts.length,
                    initialInViewIds: ['0'],
                    shrinkWrap: true,
                    onListEndReached: controller.reloadContent,
                    builder: (context, i) {
                      return Container(
                        width: Get.width,
                        height: Get.height / 2,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 2.0),
                        child: LayoutBuilder(
                          builder: (_, constraints) => InViewNotifierWidget(
                            id: '$i',
                            builder: (BuildContext context, bool isInView,
                                Widget? child) {
                              return PostFrameWidget(
                                play: isInView,
                                post: controller.posts[i],

                              );
                            },
                          ),
                        ),
                      );
                    },
                    isInViewPortCondition: (double deltaTop,
                        double deltaBottom, double vpHeight) {
                      return (deltaTop < (0.5 * vpHeight) &&
                          deltaBottom > (0.5 * vpHeight));
                    },
                  ),
                )
              : Center(
                  child: Obx(
                    () => Text(controller.errorMsg.value),
                  ),
                ),
        ),
      ),
    );
  }
}
