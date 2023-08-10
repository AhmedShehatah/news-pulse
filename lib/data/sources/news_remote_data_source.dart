
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:logger/logger.dart';

import 'package:news_pulse/core/data_source/base_remote_data_source.dart';
import 'package:news_pulse/core/enums/http_methods.dart';
import 'package:news_pulse/data/models/news_model.dart';
import 'package:news_pulse/data/remote/endpoints.dart';

import '../../core/results/result.dart';
import '../models/add_news_model.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  Future<Result<List<NewsModel>>> getAllNews({bool isPublisher = false}) async {
    return await RemoteDataSource.request<List<NewsModel>>(
      converterList: (list) {
        return list!.map((model) => NewsModel.fromJson(model)).toList();
      },
      method: HttpMethod.GET,
      url: AppEndpoints.news,
      reqiureToken: isPublisher,
    );
  }

  @override
  Future<Result<NewsModel>> addNews(AddNewsModel addNewsModel) async {
    return await RemoteDataSource.request<NewsModel>(
      converter: (model) => NewsModel.fromJson(model),
      reqiureToken: true,
      dataOnly: true,
      method: HttpMethod.POST,
      url: AppEndpoints.news,
      data: addNewsModel.toJson(),
    );
  }

  @override
  Future<Result<String>> uploadImage(File image) async {
    return await RemoteDataSource.request<String>(
        method: HttpMethod.POST,
        url: AppEndpoints.upload,
        dataOnly: true,
        converter: (model) => model['src'] as String,
        formData: FormData.fromMap({
          'image': [
            await MultipartFile.fromFile(image.path,
                filename: image.path.split("/").last)
          ],
        }));
  }
}

abstract class NewsRemoteDataSource {
  Future<Result<List<NewsModel>>> getAllNews({bool isPublisher = false});
  Future<Result<NewsModel>> addNews(AddNewsModel addNewsModel);
  Future<Result<String>> uploadImage(File image);
}
