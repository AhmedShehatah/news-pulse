import 'package:news_pulse/core/data_source/base_remote_data_source.dart';
import 'package:news_pulse/core/enums/http_methods.dart';
import 'package:news_pulse/data/models/news_model.dart';
import 'package:news_pulse/data/remote/endpoints.dart';

import '../../core/results/result.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  Future<Result<List<NewsModel>>> getAllNews({bool isPublisher = false}) {
    return RemoteDataSource.request<List<NewsModel>>(
      converterList: (list) =>
          list!.map((model) => NewsModel.fromJson(model)).toList(),
      method: HttpMethod.GET,
      url: AppEndpoints.news,
      reqiureToken: isPublisher,
    );
  }
}

abstract class NewsRemoteDataSource {
  Future<Result<List<NewsModel>>> getAllNews({bool isPublisher = false});
}
