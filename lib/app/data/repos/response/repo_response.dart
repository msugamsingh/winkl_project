import 'package:winkl_project/utils/helper/exception_handler.dart';

class RepoResponse<T> {
  final APIException? error;
  final T? data;

  bool get hasData => data != null;

  RepoResponse({this.error, this.data});
}
