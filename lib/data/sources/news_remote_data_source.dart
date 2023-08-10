import 'package:news_pulse/core/data_source/base_remote_data_source.dart';
import 'package:news_pulse/core/enums/http_methods.dart';
import 'package:news_pulse/data/models/news_model.dart';

import 'package:news_pulse/data/remote/endpoints.dart';

import '../../core/results/result.dart';

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
  Future<Result<NewsModel>> showNews({required String id}) async {
    return await RemoteDataSource.request<NewsModel>(
      converter: (model) => NewsModel.fromJson(model),
      url: "${AppEndpoints.news}/$id",
      method: HttpMethod.GET,
      dataOnly: true,
    );
  }
}

abstract class NewsRemoteDataSource {
  Future<Result<List<NewsModel>>> getAllNews({bool isPublisher = false});
  Future<Result<NewsModel>> showNews({required String id});
}
