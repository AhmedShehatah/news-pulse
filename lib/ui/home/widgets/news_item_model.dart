import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';
import 'package:news_pulse/core/utils/ui_utlis/vertical_padding.dart';
import 'package:news_pulse/data/models/news_model.dart';

class NewsItemModel extends StatelessWidget {
  final NewsModel model;
  const NewsItemModel({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: ScreenHelper.fromWidth(30),
        height: ScreenHelper.fromHeight(30),
        child: CachedNetworkImage(
          imageUrl: model.imageUrl!,
        ),
      ),
      title: Text(model.title!),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const VerticalPadding(0.5),
          Text(model.content!),
          const VerticalPadding(1),
          Row(
            children: [
              Text(model.publisher!),
              const Spacer(),
              Text(DateFormat("EEEE, MM, dd").format(model.createdAt!)),
            ],
          )
        ],
      ),
    );
  }
}
