import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:winkl_project/app/widgets/post_frame_widget.dart';

import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async  {
       controller.refresh();
      },
      child: Scaffold(
        body: Obx(
          () => controller.collectionController.favorites.isNotEmpty
              ? Obx(
                  () => InViewNotifierList(
                    itemCount: controller.collectionController.favorites.length,
                    initialInViewIds: ['0'],
                    shrinkWrap: true,
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
                              return Obx(
                                () => PostFrameWidget(
                                  play: isInView,
                                  post: controller
                                      .collectionController.favorites[i],
                                  inFavorites: true,
                                  index: i,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    isInViewPortCondition:
                        (double deltaTop, double deltaBottom, double vpHeight) {
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
