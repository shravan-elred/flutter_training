import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_company_model.freezed.dart';
part 'user_company_model.g.dart';

@freezed
sealed class UserCompanyModel with _$UserCompanyModel {
  factory UserCompanyModel({
    required String name,
    required String catchPhrase,
    required String bs,
  }) = _UserCompanyModel;

  factory UserCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$UserCompanyModelFromJson(json);
}
