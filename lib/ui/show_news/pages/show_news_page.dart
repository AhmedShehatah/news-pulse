import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_pulse/blocs/news/news_bloc.dart';
import 'package:news_pulse/core/constants/app_style.dart';
import 'package:news_pulse/core/constants/dimens.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/states/base_fail_state.dart';
import 'package:news_pulse/core/states/base_success_state.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/core/utils/screen_utlis/device_utils.dart';
import 'package:news_pulse/core/utils/ui_utlis/vertical_padding.dart';
import 'package:news_pulse/data/models/news_model.dart';
import '../../../blocs/news/news_state.dart';

// ignore: must_be_immutable
class ShowNewsPage extends StatefulWidget {
  const ShowNewsPage({
    super.key,
  });
  static const String routeName = "/show-news-page";

  @override
  State<ShowNewsPage> createState() => _ShowNewsPageState();
}

class _ShowNewsPageState extends State<ShowNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DIManager.findCC().lightgreyBackground,
      body: BlocBuilder<NewsCubit, NewsState>(
        bloc: DIManager.findDep<NewsCubit>(),
        builder: (context, state) {
          var showState = state.showNewsState;
          if (showState is BaseLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (showState is BaseFailState) {
            return const Center(
              child: Text("Error! please Try again later",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 183, 15, 3))),
            );
          } else if (showState is BaseSuccessState) {
            var news = showState.data as NewsModel;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: news.imageUrl!,
                    fit: BoxFit.fill,
                    width: ScreenHelper.width,
                  ),
                  Padding(
                    padding: Dimens.cardInternalPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              news.publisher!,
                              style: AppStyle.text14Style,
                            ),
                            Text(
                                DateFormat("EEEE, MM, dd")
                                    .format(news.createdAt!),
                                style: AppStyle.text14Style),
                          ],
                        ),
                        const VerticalPadding(1.5),
                        Text(
                          news.title!,
                          style: AppStyle.bigTitleStyle,
                        ),
                        const VerticalPadding(1.5),
                        Text(news.content!, style: AppStyle.text14Style),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var id = ModalRoute.of(context)!.settings.arguments as String;
    DIManager.findDep<NewsCubit>().showNews(id);
  }
}
