import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_pulse/data/models/news_model.dart';

class NewsItemModel extends StatelessWidget {
  final NewsModel model;
  const NewsItemModel({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CachedNetworkImage(imageUrl: model.imageUrl!),
            ListTile(
              title: Text(model.title!),
              subtitle: Text(model.content!),
            ),
          ],
        ),
        Text(model.publisher!),
        const Spacer(),
        Text(DateFormat("EEE,MM,dd").format(model.createdAt!)),
      ],
    );
  }
}
