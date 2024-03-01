import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'remote_constants.dart';

class RemoteClient {
  RemoteClient._();
  static final RemoteClient instace = RemoteClient._();

  final Dio _client = Dio(
    BaseOptions(
      baseUrl: RemoteConstants.BASE_URL,
      connectTimeout: RemoteConstants.CONNECTION_TIMEOUT,
      sendTimeout: RemoteConstants.SEND_TIMEOUT,
      receiveTimeout: RemoteConstants.RECEIVE_TIMEOUT,
    ),
  )..interceptors.addAll(
      [
        // Interceptor that prings log of every request on console
        PrettyDioLogger(
          request: true,
          compact: true,
          responseBody: true,
        )
      ],
    );

  Future<Response<dynamic>> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    try {
      return _client.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } catch (e, s) {
      log('get', name: '$runtimeType', error: e, stackTrace: s);
      rethrow;
    }
  }
}
