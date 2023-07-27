import 'package:dio/dio.dart';
import '../../../core/results/result.dart';
import '../di/di_manager.dart';
import '../enums/http_methods.dart';
import '../net/api_provider.dart';
import '../shared_prefs/shared_prefs.dart';

abstract class RemoteDataSource {
  static Future<Result<MODEL>> request<MODEL>(
      {MODEL Function(dynamic)? converter,
      MODEL Function(List<dynamic>?)? converterList,
      required HttpMethod method,
      required String url,
      Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      FormData? formData,
      bool? dataOnly,
      bool? reqiureToken}) async {
    headers ??= {};
    headers['Content-Type'] = "application/json";
    if (reqiureToken == true) {
      headers['Authorization'] =
          "Bearer ${DIManager.findDep<SharedPrefs>().getToken()}";
    }

    return await ApiProvider.sendObjectRequest<MODEL>(
      converter: converter,
      converterList: converterList,
      method: method,
      url: url,
      data: data,
      headers: headers,
      dataOnly: dataOnly,
      queryParameters: queryParameters,
      formData: formData,
    );
  }
}
