import 'package:news_pulse/core/data_source/base_remote_data_source.dart';
import 'package:news_pulse/core/enums/http_methods.dart';
import 'package:news_pulse/data/models/sign_in_model.dart';
import 'package:news_pulse/data/remote/endpoints.dart';
import '../../core/results/result.dart';
import '../models/publisher_modell/publisher_modell.dart';
import '../models/sign_up_model.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  @override
  Future<Result<PublisherModel>> signIn(SignInModel model) async {
    return await RemoteDataSource.request<PublisherModel>(
      converter: (model) => PublisherModel.fromJson(model),
      method: HttpMethod.POST,
      url: AppEndpoints.signIn,
      data: model.toJson(),
    );
  }

  @override
  Future<Result<PublisherModel>> signUp(SignUpModel model) async {
    return await RemoteDataSource.request<PublisherModel>(
      converter: (model) => PublisherModel.fromJson(model),
      method: HttpMethod.POST,
      url: AppEndpoints.signUp,
      data: model.toJson(),
    );
  }
}

abstract class AuthRemoteDataSource {
  Future<Result<PublisherModel>> signIn(SignInModel model);
  Future<Result<PublisherModel>> signUp(SignUpModel model);
}
