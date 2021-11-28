import 'package:get/get.dart';
import 'package:winkl_project/app/modules/favorites/controllers/collection_controller.dart';
import 'package:winkl_project/utils/values/strings.dart';

class FavoritesController extends GetxController {

  CollectionController collectionController = Get.find();

  var errorMsg = ''.obs;

  @override
  void onReady() {
    super.onReady();
    if (collectionController.favorites.isEmpty) {
      errorMsg.value = Strings.nothingInFavorites;
    }
  }

  Future<void> onRefresh() async {
    collectionController.assignFavorites();
    if (collectionController.favorites.isEmpty) {
      errorMsg.value = Strings.nothingInFavorites;
    }
    refresh();
  }

}
