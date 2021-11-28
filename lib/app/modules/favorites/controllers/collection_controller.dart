import 'package:get/get.dart';
import 'package:winkl_project/app/data/models/posts_model.dart';
import 'package:winkl_project/utils/storage/storage.dart';
import 'package:winkl_project/utils/values/strings.dart';

class CollectionController extends GetxController {
  List storageFavs = Storage.getFavorites();
  RxList favorites = [].obs;

  @override
  void onInit() {
    super.onInit();
    storageFavs = Storage.getFavorites();
  }

  void assignFavorites() {
    favorites.value = storageFavs;
    favorites.refresh();
  }

  void savePost(Post post) {
    if (favorites.contains(post)) {
      favorites.remove(post);
      favorites.refresh();
      Get.snackbar(
        Strings.postRemoved,
        Strings.postRemovedContent,
      );
    } else {
      favorites.add(post);
      favorites.refresh();
      Get.snackbar(
        Strings.postAdded,
        Strings.postAddedContent,
      );
    }
    List temp = [];
    for (var i in favorites) {
      temp.add(i.toJson());
    }
    Storage.setFavorites(temp);
  }
}
