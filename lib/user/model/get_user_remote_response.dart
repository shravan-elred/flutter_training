import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart';

part 'get_user_remote_response.g.dart';

@JsonSerializable()
class GetUserRemoteResponse {
  const GetUserRemoteResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory GetUserRemoteResponse.fromJsonString(String json) =>
      GetUserRemoteResponse.fromJson(jsonDecode(json));

  factory GetUserRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserRemoteResponseFromJson(json);

  final int page;
  @JsonKey(name: 'per_page')
  final int perPage;
  final int total;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  final List<UserModel> data;
}
