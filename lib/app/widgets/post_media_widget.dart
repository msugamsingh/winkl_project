import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:winkl_project/app/data/env.dart';
import 'package:winkl_project/app/data/models/posts_model.dart';
import 'package:winkl_project/app/modules/favorites/controllers/collection_controller.dart';

class PostMediaContent extends StatefulWidget {
  final String videoUrl;
  final String thumbnail;
  final Post post;
  final bool play;
  final bool inFavorites;
  final int? index;

  const PostMediaContent(
      {Key? key,
      required this.videoUrl,
      required this.play,
      required this.thumbnail,
      required this.post,
      this.inFavorites = false,
      this.index})
      : super(key: key);

  @override
  _PostMediaContentState createState() => _PostMediaContentState();
}

class _PostMediaContentState extends State<PostMediaContent> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late CollectionController collectionController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });

    collectionController = Get.find();

    if (widget.play) {
      _controller.play();
      _controller.setLooping(true);
    }
  }

  @override
  void didUpdateWidget(PostMediaContent oldWidget) {
    // if (oldWidget.videoUrl != widget.videoUrl) {
    //   _controller = VideoPlayerController.network(widget.videoUrl);
    //   _initializeVideoPlayerFuture = _controller.initialize().then((_) {
    //     setState(() {});
    //   });
    // }
    if (oldWidget.play != widget.play) {
      if (widget.play) {
        _controller.play();
        _controller.setLooping(true);
      } else {
        _controller.pause();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: () {
              if (widget.play) {
                if (_controller.value.volume == 0.0) {
                  _controller.setVolume(1.0);
                } else {
                  _controller.setVolume(0.0);
                }
              }
            },
            onDoubleTap: () {
              if (widget.play) {
                collectionController.savePost(widget.post);
                if (widget.inFavorites) {
                  _controller.pause();
                }
              }
              // if (widget.play && widget.inFavorites) {
              //   var newIndex = 0;
              //   if (widget.index! + 1 ==
              //       collectionController.favorites.length) {
              //     newIndex = widget.index! - 1;
              //   } else if (widget.index! + 1 ==
              //       collectionController.favorites.length) {
              //     newIndex = widget.index!;
              //   }
              //   collectionController.savePost(widget.post);
              //   collectionController.favorites.refresh();
              //
              //   _controller = VideoPlayerController.network(
              //       collectionController.favorites[newIndex].sources.first);
              //   _initializeVideoPlayerFuture =
              //       _controller.initialize().then((_) {
              //     setState(() {});
              //   });
              //   _controller.play();
              //   _controller.setLooping(true);
              // }
            },
            child: VideoPlayer(_controller),
          );
        } else {
          return CachedNetworkImage(
            imageUrl: URLs.generateThumbnailURL(widget.thumbnail),
            fit: BoxFit.cover,
            width: Get.width,
          );
        }
      },
    );
  }
}
