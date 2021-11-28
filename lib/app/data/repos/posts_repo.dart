import 'package:winkl_project/app/data/env.dart';
import 'package:winkl_project/app/data/models/posts_model.dart';
import 'package:winkl_project/app/data/network/network_requester.dart';
import 'package:winkl_project/app/data/repos/response/repo_response.dart';
import 'package:winkl_project/utils/helper/exception_handler.dart';

class PostsRepository {
  Future<RepoResponse<Posts>> getAllPosts({required int offset}) async {
    var response = await NetworkRequester.shared.get(path: URLs.sampleVideos, query: {
      'limit': 20,
      'offset': offset
    });
    return response is APIException
        ? RepoResponse(error: response, data: null)
        : RepoResponse(data: Posts.fromJson(response));
  }
}
