import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_address_geo_model.dart';

part 'user_address_model.freezed.dart';
part 'user_address_model.g.dart';

@freezed
sealed class UserAddressModel with _$UserAddressModel {
  factory UserAddressModel({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required UserAddressGeoModel geo,
  }) = _UserAddressModel;

  factory UserAddressModel.fromJson(Map<String, dynamic> json) =>
      _$UserAddressModelFromJson(json);
}
