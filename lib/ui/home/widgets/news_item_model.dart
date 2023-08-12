import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_pulse/core/constants/app_style.dart';
import 'package:news_pulse/core/constants/dimens.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';
import 'package:news_pulse/core/utils/ui_utlis/horizontal_padding.dart';
import 'package:news_pulse/core/utils/ui_utlis/vertical_padding.dart';
import 'package:news_pulse/data/models/news_model.dart';

import '../../../core/di/di_manager.dart';

class NewsItemModel extends StatelessWidget {
  final NewsModel model;
  const NewsItemModel({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.cardSmallInternalPadding.copyWith(bottom: 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.defaultBorderRadius),
        child: Container(
          color: DIManager.findCC().white,
          height: ScreenHelper.fromHeight(15),
          padding:
              Dimens.cardInternalPadding.copyWith(left: 0, top: 0, bottom: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CachedNetworkImage(
                imageUrl: model.imageUrl!.isEmpty
                    ? 'https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg'
                    : model.imageUrl!,
                width: ScreenHelper.fromWidth(35),
                height: ScreenHelper.fromHeight(15),
                errorWidget: (context, url, _) => Image.network(
                    'https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg'),
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                  color: DIManager.findCC().primaryColor,
                )),
              ),
              const HorizontalPadding(2),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const VerticalPadding(1),
                    SizedBox(
                      width: ScreenHelper.fromWidth(45),
                      child: Text(
                        model.title ?? 'No Title',
                        style: AppStyle.titleStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    SizedBox(
                      width: ScreenHelper.fromHeight(25),
                      child: Text(
                        model.content ?? 'No Content',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.lightSubtitle,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.publisher ?? 'No Publisher',
                          style: AppStyle.lightSubtitle,
                        ),
                        Text(
                          DateFormat("EEEE, MM, dd").format(model.createdAt!),
                          style: AppStyle.lightSubtitle,
                        ),
                      ],
                    ),
                    const VerticalPadding(1),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
