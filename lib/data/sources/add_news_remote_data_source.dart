import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_pulse/core/data_source/base_remote_data_source.dart';
import 'package:news_pulse/core/enums/http_methods.dart';
import 'package:news_pulse/data/models/add_news_model.dart';
import 'package:news_pulse/data/models/news_model.dart';
import 'package:news_pulse/data/remote/endpoints.dart';

import '../../core/results/result.dart';

class AddNewsRemoteDataSourceImp implements AddNewsRemoteDataSource {
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
        converter: (model) => model['src'],
        formData: FormData.fromMap({
          'files': [
            await MultipartFile.fromFile(image.path,
                filename: image.path.split("/").last)
          ],
        }));
  }
}

abstract class AddNewsRemoteDataSource {
  Future<Result<NewsModel>> addNews(AddNewsModel addNewsModel);
  Future<Result<String>> uploadImage(File image);
}
