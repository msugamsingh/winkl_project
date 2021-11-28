import 'package:get_storage/get_storage.dart';
import 'package:winkl_project/app/data/models/posts_model.dart';

class Storage {
  Storage._privateConstructor();

  static final _box = GetStorage();

  static void setFavorites(List favList) {
    _box.write(StorageKeys.FAV, favList);
  }

  static List<Post> getFavorites() {
    List<Post> l = [];
    List temp =  _box.read(StorageKeys.FAV)??[];
    for (var i in temp) {
      Post p = Post.fromJson(i);
      l.add(p);
    }
    print(l.length);

    return l;
  }

}

class StorageKeys {
  StorageKeys._privateConstructor();
  static const FAV = 'favorites';
}
