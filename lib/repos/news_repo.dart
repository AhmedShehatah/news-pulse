import 'package:news_pulse/data/models/news_model.dart';
import 'package:news_pulse/data/sources/news_remote_data_source.dart';

import '../core/results/result.dart';

class NewsRepoImpl implements NewsRepo {
  final NewsRemoteDataSource _newsRemoteDataSource;
  NewsRepoImpl(this._newsRemoteDataSource);
  @override
  Future<Result<List<NewsModel>>> getAllNews({bool isPublisher = false}) async {
    return await _newsRemoteDataSource.getAllNews(isPublisher: isPublisher);
  }
}

abstract class NewsRepo {
  Future<Result<List<NewsModel>>> getAllNews({bool isPublisher = false});
}
