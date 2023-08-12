import 'package:news_pulse/core/data_source/base_remote_data_source.dart';
import 'package:news_pulse/core/enums/http_methods.dart';
import 'package:news_pulse/core/results/result.dart';
import 'package:news_pulse/data/models//about_us_model.dart';
import 'package:news_pulse/data/remote/endpoints.dart';

import '../models/contact_us_model.dart';

class InfoRemoteDataSourceImpl implements InfoRemoteDataSource {
  @override
  Future<Result<ContactUsModel>> contactUs(ContactUsModel model) async {
    return await RemoteDataSource.request<ContactUsModel>(
      converter: (model) => ContactUsModel.fromJson(model),
      method: HttpMethod.POST,
      url: AppEndpoints.contactUs,
      data: model.toJson(),
    );
  }

  @override
  Future<Result<AboutUsModel>> aboutUs() async {
    return await RemoteDataSource.request<AboutUsModel>(
      converter: (list) => (list as List<dynamic>)
          .map((model) => AboutUsModel.fromJson(model))
          .toList()[0],
      method: HttpMethod.GET,
      url: AppEndpoints.aboutus,
      dataOnly: true,
    );
  }
}

abstract class InfoRemoteDataSource {
  Future<Result<ContactUsModel>> contactUs(ContactUsModel model);
  Future<Result<AboutUsModel>> aboutUs();
}
