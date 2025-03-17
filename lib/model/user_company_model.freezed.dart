// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserCompanyModel {
  String get name;
  String get catchPhrase;
  String get bs;

  /// Create a copy of UserCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCompanyModelCopyWith<UserCompanyModel> get copyWith =>
      _$UserCompanyModelCopyWithImpl<UserCompanyModel>(
          this as UserCompanyModel, _$identity);

  /// Serializes this UserCompanyModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserCompanyModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.catchPhrase, catchPhrase) ||
                other.catchPhrase == catchPhrase) &&
            (identical(other.bs, bs) || other.bs == bs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, catchPhrase, bs);

  @override
  String toString() {
    return 'UserCompanyModel(name: $name, catchPhrase: $catchPhrase, bs: $bs)';
  }
}

/// @nodoc
abstract mixin class $UserCompanyModelCopyWith<$Res> {
  factory $UserCompanyModelCopyWith(
          UserCompanyModel value, $Res Function(UserCompanyModel) _then) =
      _$UserCompanyModelCopyWithImpl;
  @useResult
  $Res call({String name, String catchPhrase, String bs});
}

/// @nodoc
class _$UserCompanyModelCopyWithImpl<$Res>
    implements $UserCompanyModelCopyWith<$Res> {
  _$UserCompanyModelCopyWithImpl(this._self, this._then);

  final UserCompanyModel _self;
  final $Res Function(UserCompanyModel) _then;

  /// Create a copy of UserCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? catchPhrase = null,
    Object? bs = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      catchPhrase: null == catchPhrase
          ? _self.catchPhrase
          : catchPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      bs: null == bs
          ? _self.bs
          : bs // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserCompanyModel implements UserCompanyModel {
  _UserCompanyModel(
      {required this.name, required this.catchPhrase, required this.bs});
  factory _UserCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$UserCompanyModelFromJson(json);

  @override
  final String name;
  @override
  final String catchPhrase;
  @override
  final String bs;

  /// Create a copy of UserCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCompanyModelCopyWith<_UserCompanyModel> get copyWith =>
      __$UserCompanyModelCopyWithImpl<_UserCompanyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserCompanyModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCompanyModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.catchPhrase, catchPhrase) ||
                other.catchPhrase == catchPhrase) &&
            (identical(other.bs, bs) || other.bs == bs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, catchPhrase, bs);

  @override
  String toString() {
    return 'UserCompanyModel(name: $name, catchPhrase: $catchPhrase, bs: $bs)';
  }
}

/// @nodoc
abstract mixin class _$UserCompanyModelCopyWith<$Res>
    implements $UserCompanyModelCopyWith<$Res> {
  factory _$UserCompanyModelCopyWith(
          _UserCompanyModel value, $Res Function(_UserCompanyModel) _then) =
      __$UserCompanyModelCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String catchPhrase, String bs});
}

/// @nodoc
class __$UserCompanyModelCopyWithImpl<$Res>
    implements _$UserCompanyModelCopyWith<$Res> {
  __$UserCompanyModelCopyWithImpl(this._self, this._then);

  final _UserCompanyModel _self;
  final $Res Function(_UserCompanyModel) _then;

  /// Create a copy of UserCompanyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? catchPhrase = null,
    Object? bs = null,
  }) {
    return _then(_UserCompanyModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      catchPhrase: null == catchPhrase
          ? _self.catchPhrase
          : catchPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      bs: null == bs
          ? _self.bs
          : bs // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
