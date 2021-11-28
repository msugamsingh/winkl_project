class Posts {
  late bool status;
  late int totalVideos;
  late int videoCount;
  List<Post>? post;

  Posts(
      {required this.status,
      required this.totalVideos,
      required this.videoCount,
      this.post});

  Posts.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalVideos = json['total_videos'];
    videoCount = json['video_count'];
    if (json['data'] != null) {
      post = <Post>[];
      json['data'].forEach((v) {
        post!.add(Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['total_videos'] = totalVideos;
    data['video_count'] = videoCount;
    data['data'] = post?.map((v) => v.toJson()).toList() ?? [];
    return data;
  }
}

class Post {
  late String description;
  late List<String> sources;
  late String subtitle;
  late String thumb;
  late String title;

  Post(
      {required this.description,
      required this.sources,
      required this.subtitle,
      required this.thumb,
      required this.title});

  Post.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    sources = json['sources'].cast<String>();
    subtitle = json['subtitle'];
    thumb = json['thumb'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['sources'] = sources;
    data['subtitle'] = subtitle;
    data['thumb'] = thumb;
    data['title'] = title;
    return data;
  }
}
