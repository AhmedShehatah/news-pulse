import 'dart:io';

import 'package:dio/dio.dart';

import '../di/di_manager.dart';
import '../enums/http_methods.dart';
import '../errors/base_error.dart';
import '../errors/cancel_error.dart';
import '../errors/custom_error.dart';
import '../errors/net_error.dart';
import '../errors/not_found_error.dart';
import '../errors/time_out_error.dart';
import '../errors/unauthorized_error.dart';
import '../errors/unexpected_error.dart';
import '../results/result.dart';

class ApiProvider {
  static Future<Result<T>> sendObjectRequest<T>({
    T Function(dynamic)? converter,
    T Function(List<dynamic>)? converterList,
    required HttpMethod method,
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    FormData? formData,
    bool? dataOnly,
  }) async {
    try {
      // Get the response from the server
      late Response response;
      final dio = DIManager.findDep<Dio>();

      switch (method) {
        case HttpMethod.GET:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
            options: Options(headers: headers),
          );
          break;
        case HttpMethod.POST:
          response = await dio.post(
            url,
            data: data ?? formData,
            queryParameters: queryParameters,
            options: Options(headers: headers),
          );
          break;
        case HttpMethod.PUT:
          response = await dio.put(
            url,
            data: data ?? formData,
            queryParameters: queryParameters,
            options: Options(headers: headers),
          );
          break;
        case HttpMethod.DELETE:
          response = await dio.delete(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
          );
          break;
        case HttpMethod.PATCH:
          response = await dio.patch(
            url,
            data: data,
            queryParameters: queryParameters,
            options: Options(headers: headers),
          );
          break;
      }

      if (converterList != null) {
        // TODO removed ['data'] temp because of backend
        return Result(data: converterList(response.data['blogs']));
      }
      if (dataOnly == true) {
        return Result(data: converter!(response.data['data']));
      } else {
        return Result(data: converter!(response.data));
      }
    }

    // Handling errors
    on DioException catch (e) {
      return Result(error: _handleDioException(e));
    }

    // Couldn't reach out the server
    on SocketException catch (_) {
      return Result(error: CustomError(message: 'Socket Error'));
    } catch (e) {
      return Result(error: CustomError(message: e.toString()));
    }
  }

  static BaseError _handleDioException(DioException error) {
    if (error.type == DioExceptionType.unknown ||
        error.type == DioExceptionType.badResponse) {
      if (error is SocketException) return NetError();
      if (error.type == DioExceptionType.badResponse) {
        switch (error.response!.statusCode) {
          case 401:
            // TODO move to main page
            return UnauthorizedError(message: error.response!.data['message']);
          case 400:
          case 404:
            return NotFoundError(message: error.response!.data['message']);
          case 403:
          case 409:
          case 500:
            return NetError(message: error.response!.data['message']);
          default:
            return CustomError(message: error.response!.data['message']);
        }
      }
      return NetError();
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return TimeOutError();
    } else if (error.type == DioExceptionType.cancel) {
      return CancelError();
    } else {
      return UnExpectedError();
    }
  }
}
