import 'dart:io';

import 'package:news_pulse/data/models/news_model.dart';
import 'package:news_pulse/data/sources/news_remote_data_source.dart';

import '../core/results/result.dart';
import '../data/models/add_news_model.dart';

class NewsRepoImpl implements NewsRepo {
  final NewsRemoteDataSource _newsRemoteDataSource;
  NewsRepoImpl(this._newsRemoteDataSource);
  @override
  Future<Result<List<NewsModel>>> getAllNews({bool isPublisher = false}) async {
    return await _newsRemoteDataSource.getAllNews(isPublisher: isPublisher);
  }

  @override
  Future<Result<String>> uploadImage(File image) async {
    return await _newsRemoteDataSource.uploadImage(image);
  }

  @override
  Future<Result<NewsModel>> addNews(AddNewsModel model) async {
    return await _newsRemoteDataSource.addNews(model);
  }
}

abstract class NewsRepo {
  Future<Result<List<NewsModel>>> getAllNews({bool isPublisher = false});
  Future<Result<String>> uploadImage(File image);
  Future<Result<NewsModel>> addNews(AddNewsModel model);
}
