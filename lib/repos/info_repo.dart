import 'package:news_pulse/data/sources/info_remote_data_source.dart';

import '../core/results/result.dart';
import '../data/models/contact_us_model.dart';

class InfoRepoImpl implements InfoRepo {
  final InfoRemoteDataSource infoRemoteData;
  InfoRepoImpl(this.infoRemoteData);

  @override
  Future<Result<ContactUsModel>> contactUs(ContactUsModel model) async {
    return await infoRemoteData.contactUs(model);
  }
}

abstract class InfoRepo {
  Future<Result<ContactUsModel>> contactUs(ContactUsModel model);
}
