import 'package:flutter/material.dart';
import 'package:winkl_project/app/data/models/posts_model.dart';
import 'package:winkl_project/app/theme/styles.dart';

class DescriptionBottomsheet extends StatelessWidget {
  final Post post;

  const DescriptionBottomsheet({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      elevation: 28,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28),
      )),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.title, style: Styles.tsRegularBold18),
                  Text(post.subtitle, style: Styles.tsRegularSmall12,),
                ],
              ),
              SizedBox(height: 8),
              Text(post.description)
            ],
          ),
        );
      },
      onClosing: () {},
    );
  }
}
