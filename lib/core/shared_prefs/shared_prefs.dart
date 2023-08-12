import 'package:get_storage/get_storage.dart';
import 'package:news_pulse/core/constants/app_consts.dart';

class SharedPrefs {
  /// always use encapsulation to read and write values
  /// Token
  final ReadWriteValue<String?> _appToken =
      ReadWriteValue("appToken${AppConsts.appName}", null);
  String? getToken() => _appToken.val;
  void setToken(String token) => _appToken.val = token;
  //UserName
  final ReadWriteValue<String?> _appUserName =
      ReadWriteValue("appUserName${AppConsts.appName}", null);
  String? getUserName() => _appUserName.val;
  void setUserName(String userName) => _appUserName.val = userName;
  //Id
  final ReadWriteValue<String?> _appId =
      ReadWriteValue("appId${AppConsts.appName}", null);
  String? getId() => _appId.val;
  void setId(String id) => _appId.val = id;
  //Email
  final ReadWriteValue<String?> _appEmail =
      ReadWriteValue("appEmail${AppConsts.appName}", null);
  String? getEmail() => _appEmail.val;
  void setEmail(String email) => _appEmail.val = email;

  // logout
  void logout() {
    _appToken.val = _appEmail.val = _appId.val = _appUserName.val = null;
  }
}
