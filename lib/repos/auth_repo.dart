import 'package:news_pulse/data/models/sign_in_model.dart';
import 'package:news_pulse/data/sources/auth_remote_data_source.dart';

import '../core/results/result.dart';
import '../data/models/publisher_modell/publisher_modell.dart';
import '../data/models/sign_up_model.dart';

class AuthRepoImp implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImp(
    this._authRemoteDataSource,
  );
  @override
  Future<Result<PublisherModel>> signIn(SignInModel model) async {
    return await _authRemoteDataSource.signIn(model);
  }

  @override
  Future<Result<PublisherModel>> signUp(SignUpModel model) async {
    return await _authRemoteDataSource.signUp(model);
  }
}

abstract class AuthRepo {
  Future<Result<PublisherModel>> signIn(SignInModel model);
  Future<Result<PublisherModel>> signUp(SignUpModel model);
}
