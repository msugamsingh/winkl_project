import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winkl_project/app/data/models/posts_model.dart';
import 'package:winkl_project/app/theme/styles.dart';
import 'package:winkl_project/app/widgets/description_bottomsheet.dart';
import 'package:winkl_project/app/widgets/post_media_widget.dart';
import 'package:winkl_project/utils/values/strings.dart';
import 'my_text_button.dart';

class PostFrameWidget extends StatelessWidget {
  final Post post;
  final bool play;
  final bool inFavorites;
  final int? index;

  const PostFrameWidget(
      {Key? key,
      required this.post,
      required this.play,
      this.inFavorites = false, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      height: Get.height / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title, style: Styles.tsRegularMed24),
              Text(post.subtitle),
            ],
          ).paddingOnly(left: 8),
          SizedBox(height: 8),
          Expanded(
            child: PostMediaContent(
              videoUrl: post.sources.first,
              thumbnail: post.thumb,
              play: play,
              post: post,
              inFavorites: inFavorites,
              index: index,
            ),
          ),
          SizedBox(height: 8),
          Text(
            post.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ).paddingSymmetric(horizontal: 8),
          Align(
            alignment: Alignment.centerRight,
            child: MyTextButton(
              label: Strings.readMore,
              onTap: () {
                Get.bottomSheet(DescriptionBottomsheet(post: post));
              },
            ),
          ).paddingOnly(right: 8),
          Divider(),
        ],
      ),
    );
  }
}
