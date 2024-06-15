import 'dart:async';
import 'dart:developer';

import 'package:http/http.dart';

class RemoteClient {
  RemoteClient({
    required this.host,
    this.headers,
  });

  final String host;
  final Map<String, String>? headers;
  final Client _client = Client();

  Future<Response?> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _client.get(
        _getUri(path, queryParameters),
      );
      if (response.statusCode == 200) return response;
      log('Something went wrong!');
    } catch (e, s) {
      log('get', error: e, stackTrace: s);
    }
    return null;
  }

  Future<Response?> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _client.post(
        _getUri(path, queryParameters),
        body: body,
        headers: headers,
      );
      if (response.statusCode == 200) return response;
      log('Something went wrong!');
    } catch (e, s) {
      log('post', error: e, stackTrace: s);
    }
    return null;
  }

  Uri _getUri(
    String path,
    Map<String, dynamic>? queryParameters,
  ) {
    return Uri(
      scheme: _getScheme(host),
      host: _getHost(host),
      path: path,
      queryParameters: queryParameters?.map<String, String>(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );
  }

  String _getScheme(String host) {
    return host.contains('https') ? 'https' : 'http';
  }

  String _getHost(String host) {
    final pattern = RegExp(r'https?:\/\/');
    return host.replaceAll(pattern, '');
  }
}
