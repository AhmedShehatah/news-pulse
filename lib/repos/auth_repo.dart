import 'package:news_pulse/data/models/sign_in_model.dart';
import 'package:news_pulse/data/sources/auth_remote_data_source.dart';

import '../core/results/result.dart';
import '../data/models/publisher_modell/publisher_modell.dart';

class AuthRepoImp implements AuthRepo {
  final AuthRemoteDataSource _signInRemoteDataSource;

  AuthRepoImp(this._signInRemoteDataSource);
  @override
  Future<Result<PublisherModel>> signIn(SignInModel model) async {
    return await _signInRemoteDataSource.signIn(model);
  }
}

abstract class AuthRepo {
  Future<Result<PublisherModel>> signIn(SignInModel model);
}
