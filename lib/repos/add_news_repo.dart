import 'dart:io';

import 'package:news_pulse/core/results/result.dart';
import 'package:news_pulse/data/models/add_news_model.dart';
import 'package:news_pulse/data/models/news_model.dart';
import 'package:news_pulse/data/sources/add_news_remote_data_source.dart';

class AddNewsRepoImp implements AddNewsRepo {
  final AddNewsRemoteDataSource _addNewsRemoteDataSource;

  AddNewsRepoImp(this._addNewsRemoteDataSource);
  @override
  Future<Result<String>> uploadImage(File image) async {
    return await _addNewsRemoteDataSource.uploadImage(image);
  }

  @override
  Future<Result<NewsModel>> addNews(AddNewsModel model) async {
    return await _addNewsRemoteDataSource.addNews(model);
  }
}

abstract class AddNewsRepo {
  Future<Result<String>> uploadImage(File image);
  Future<Result<NewsModel>> addNews(AddNewsModel model);
}
