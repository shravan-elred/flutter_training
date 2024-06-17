// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserRemoteResponse _$GetUserRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    GetUserRemoteResponse(
      page: (json['page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserRemoteResponseToJson(
        GetUserRemoteResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
    };
