class Env {
  Env._privateConstructor();

  static const title = "Winkl";

  static const baseURL = 'https://api.winkl.in/';

  static const authToken = 'Token ruor7REQi9KJz6wIQKDXvwtt';
}

class URLs {
  static const sampleVideos = 'sample_videos';

  static String generateThumbnailURL(String url) {
    return 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/$url';
  }
}
