import 'package:flutter/foundation.dart';
import 'package:worker_manager/worker_manager.dart';

import '../../core/remote/remote_client.dart';
import '../model/get_user_remote_response.dart';

class UserRemoteService {
  final RemoteClient client = RemoteClient(
    host: 'https://reqres.in',
  );

  Future<GetUserRemoteResponse?> getAllUsers() async {
    final response = await client.get(path: 'api/users');
    if (response != null) {
      return await _parseToUserResponseExecuteGentle(response.body);
    }
    return null;
  }

  Future<GetUserRemoteResponse> _parseToUserResponse(String body) async {
    return compute(
      GetUserRemoteResponse.fromJson,
      body,
    );
  }

  void dispose() async {
    workerManager.dispose();
  }

  Future<GetUserRemoteResponse> _parseToUserResponseExecute(
    String body,
  ) async {
    return workerManager
        .execute<GetUserRemoteResponse>(
          () => GetUserRemoteResponse.fromJson(body),
        )
        .future;
  }

  Future<GetUserRemoteResponse> _parseToUserResponseExecuteGentle(
      String body) async {
    return workerManager
        .executeGentle<GetUserRemoteResponse>(
          (_) => GetUserRemoteResponse.fromJson(body),
        )
        .future;
  }
}
