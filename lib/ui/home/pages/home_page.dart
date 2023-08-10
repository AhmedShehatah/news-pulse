import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_pulse/blocs/news/news_bloc.dart';
import 'package:news_pulse/core/di/di_manager.dart';
import 'package:news_pulse/core/states/base_success_state.dart';
import 'package:news_pulse/core/states/base_wait_state.dart';
import 'package:news_pulse/data/models/news_model.dart';
import 'package:news_pulse/ui/home/widgets/news_item_model.dart';

import '../../../blocs/news/news_state.dart';
import '../../show_news/pages/show_news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = "/home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DIManager.findCC().primaryColor,
      body: BlocBuilder<NewsCubit, NewsState>(
        bloc: DIManager.findDep<NewsCubit>(),
        builder: (context, state) {
          var newsState = state.getAllNewsState;
          if (newsState is BaseLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (newsState is BaseSuccessState) {
            var newsList = newsState.data as List<NewsModel>;
            if (newsList.isEmpty) {
              return Center(
                child: Text(
                  "New Current News",
                  style: TextStyle(color: DIManager.findCC().white),
                ),
              );
            }
            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      DIManager.findNavigator().pushNamed(
                          ShowNewsPage.routeName,
                          arguments: newsList[index].id!);
                    },
                    child: NewsItemModel(model: newsList[index]));
              },
              itemCount: newsList.length,
              separatorBuilder: ((context, index) => const Divider()),
            );
          } else {
            return const Center(
              child: Text('Error Happened Try Again'),
            );
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    DIManager.findDep<NewsCubit>().getAllNews();
  }
}
