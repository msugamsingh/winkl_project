import 'package:get/get.dart';
import 'package:winkl_project/app/data/models/posts_model.dart';
import 'package:winkl_project/app/data/repos/posts_repo.dart';
import 'package:winkl_project/app/data/repos/response/repo_response.dart';
import 'package:winkl_project/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:winkl_project/utils/loading/loading_utils.dart';
import 'package:winkl_project/utils/values/strings.dart';

class HomeController extends GetxController {
  final PostsRepository _repo = PostsRepository();
  final FavoritesController favoritesController = FavoritesController();
  RxList posts = [].obs;
  RxString errorMsg = ''.obs;

  void loadContent() async {
    LoadingUtils.showLoader();
    RepoResponse<Posts?> response = await _repo.getAllPosts(offset: 0);
    LoadingUtils.hideLoader();
    if (response.error == null) {
      posts.addAll(response.data?.post ?? []);
      posts.refresh();
    } else {
      errorMsg.value =
          response.error?.message ?? ErrorMessages.somethingWentWrong;
    }
  }

  void reloadContent() async {
    RepoResponse<Posts?> response =
        await _repo.getAllPosts(offset: posts.length);
    if (response.error == null) {
      posts.addAll(response.data?.post ?? []);
      posts.refresh();
    }
  }

  @override
  void onReady() {
    super.onReady();
    loadContent();
  }
}
