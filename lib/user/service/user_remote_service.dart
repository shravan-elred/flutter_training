import 'package:flutter/foundation.dart';
import 'package:worker_manager/worker_manager.dart';

import '../../core/remote/remote_client.dart';
import '../model/get_user_remote_response.dart';

class UserRemoteService {
  final _client = RemoteClient(
    host: 'https://reqres.in',
  );

  Future<GetUserRemoteResponse?> getAllUsers() async {
    final response = await _client.get(
      path: 'api/users',
      queryParameters: {
        'page': 1,
        'per_page': 12,
      },
    );
    if (response != null) {
      return await _parseToUserResponseExecute(response.body);
    }
    return null;
  }

  Future<GetUserRemoteResponse> _parseToUserResponse(String body) async {
    return GetUserRemoteResponse.fromJsonString(body);
  }

  Future<GetUserRemoteResponse> _parseToUserResponseCompute(String body) async {
    return compute(
      GetUserRemoteResponse.fromJsonString,
      body,
    );
  }

  Future<GetUserRemoteResponse> _parseToUserResponseExecute(
    String body,
  ) async {
    return workerManager
        .execute<GetUserRemoteResponse>(
          () => GetUserRemoteResponse.fromJsonString(body),
          priority: WorkPriority.low,
        )
        .future;
  }

  Future<GetUserRemoteResponse> _parseToUserResponseExecuteGentle(
      String body) async {
    return workerManager
        .executeGentle<GetUserRemoteResponse>(
          (_) => GetUserRemoteResponse.fromJsonString(body),
          priority: WorkPriority.immediately,
        )
        .future;
  }

  void dispose() async {
    workerManager.dispose();
  }
}
