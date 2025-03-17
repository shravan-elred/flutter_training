import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_address_model.dart';
import 'user_company_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
    required UserAddressModel address,
    required UserCompanyModel company,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
