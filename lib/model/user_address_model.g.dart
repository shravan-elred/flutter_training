// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserAddressModel _$UserAddressModelFromJson(Map<String, dynamic> json) =>
    _UserAddressModel(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      geo: UserAddressGeoModel.fromJson(json['geo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserAddressModelToJson(_UserAddressModel instance) =>
    <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };
