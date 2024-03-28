import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/core/api/end_points.dart';
import 'package:untitled3/core/utils/app_strings.dart';

import '../core/api/status_code.dart';
import '../core/errors/exceptions.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    debugPrint('dio helper run');
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseURL,
        followRedirects: false,
        validateStatus: (_) => true,
        receiveDataWhenStatusError: true,
        headers: {
          AppStrings.contentType: AppStrings.applicationJson,
          AppStrings.responseLang: AppStrings.responseLangValue,
        },
      ),
    );
  }

  static Future<Response> post(
      {required String path,
        String? token,
      Map<String, dynamic>? body,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters}) async {
    return await dio!.post(path,
        options: Options(headers: {
          'Authorization': token,
        }),
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body);
  }

  dynamic handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
