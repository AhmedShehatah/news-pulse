import 'package:get_storage/get_storage.dart';
import 'package:news_pulse/core/constants/app_consts.dart';

class SharedPrefs {
  /// always use encapsulation to read and write values
  /// EX
  final ReadWriteValue<String?> _appToken =
      ReadWriteValue("appToken${AppConsts.appName}", null);
  String? getToken() => _appToken.val;
  void setToken(String token) => _appToken.val = token;
}
