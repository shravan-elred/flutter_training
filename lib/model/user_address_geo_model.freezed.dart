// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_address_geo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAddressGeoModel {
  String get lat;
  String get lng;

  /// Create a copy of UserAddressGeoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserAddressGeoModelCopyWith<UserAddressGeoModel> get copyWith =>
      _$UserAddressGeoModelCopyWithImpl<UserAddressGeoModel>(
          this as UserAddressGeoModel, _$identity);

  /// Serializes this UserAddressGeoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserAddressGeoModel &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @override
  String toString() {
    return 'UserAddressGeoModel(lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class $UserAddressGeoModelCopyWith<$Res> {
  factory $UserAddressGeoModelCopyWith(
          UserAddressGeoModel value, $Res Function(UserAddressGeoModel) _then) =
      _$UserAddressGeoModelCopyWithImpl;
  @useResult
  $Res call({String lat, String lng});
}

/// @nodoc
class _$UserAddressGeoModelCopyWithImpl<$Res>
    implements $UserAddressGeoModelCopyWith<$Res> {
  _$UserAddressGeoModelCopyWithImpl(this._self, this._then);

  final UserAddressGeoModel _self;
  final $Res Function(UserAddressGeoModel) _then;

  /// Create a copy of UserAddressGeoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_self.copyWith(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserAddressGeoModel implements UserAddressGeoModel {
  _UserAddressGeoModel({required this.lat, required this.lng});
  factory _UserAddressGeoModel.fromJson(Map<String, dynamic> json) =>
      _$UserAddressGeoModelFromJson(json);

  @override
  final String lat;
  @override
  final String lng;

  /// Create a copy of UserAddressGeoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserAddressGeoModelCopyWith<_UserAddressGeoModel> get copyWith =>
      __$UserAddressGeoModelCopyWithImpl<_UserAddressGeoModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserAddressGeoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAddressGeoModel &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @override
  String toString() {
    return 'UserAddressGeoModel(lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class _$UserAddressGeoModelCopyWith<$Res>
    implements $UserAddressGeoModelCopyWith<$Res> {
  factory _$UserAddressGeoModelCopyWith(_UserAddressGeoModel value,
          $Res Function(_UserAddressGeoModel) _then) =
      __$UserAddressGeoModelCopyWithImpl;
  @override
  @useResult
  $Res call({String lat, String lng});
}

/// @nodoc
class __$UserAddressGeoModelCopyWithImpl<$Res>
    implements _$UserAddressGeoModelCopyWith<$Res> {
  __$UserAddressGeoModelCopyWithImpl(this._self, this._then);

  final _UserAddressGeoModel _self;
  final $Res Function(_UserAddressGeoModel) _then;

  /// Create a copy of UserAddressGeoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_UserAddressGeoModel(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
