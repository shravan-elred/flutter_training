import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_address_geo_model.freezed.dart';
part 'user_address_geo_model.g.dart';

@freezed
sealed class UserAddressGeoModel with _$UserAddressGeoModel {
  factory UserAddressGeoModel({
    required String lat,
    required String lng,
  }) = _UserAddressGeoModel;

  factory UserAddressGeoModel.fromJson(Map<String, dynamic> json) =>
      _$UserAddressGeoModelFromJson(json);
}
