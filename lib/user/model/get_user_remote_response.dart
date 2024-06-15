import 'dart:convert';

import 'user_model.dart';

class GetUserRemoteResponse {
  const GetUserRemoteResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory GetUserRemoteResponse.fromMap(Map<String, dynamic> map) {
    return GetUserRemoteResponse(
      page: map['page'] as int,
      perPage: map['per_page'] as int,
      total: map['total'] as int,
      totalPages: map['total_pages'] as int,
      data: List<UserModel>.from(
        (map['data'] as List).map<UserModel>(
          (x) => UserModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
  factory GetUserRemoteResponse.fromJson(String source) =>
      GetUserRemoteResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserModel> data;
}
