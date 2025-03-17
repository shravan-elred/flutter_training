// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAddressModel {
  String get street;
  String get suite;
  String get city;
  String get zipcode;
  UserAddressGeoModel get geo;

  /// Create a copy of UserAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserAddressModelCopyWith<UserAddressModel> get copyWith =>
      _$UserAddressModelCopyWithImpl<UserAddressModel>(
          this as UserAddressModel, _$identity);

  /// Serializes this UserAddressModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserAddressModel &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.suite, suite) || other.suite == suite) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            (identical(other.geo, geo) || other.geo == geo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, street, suite, city, zipcode, geo);

  @override
  String toString() {
    return 'UserAddressModel(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }
}

/// @nodoc
abstract mixin class $UserAddressModelCopyWith<$Res> {
  factory $UserAddressModelCopyWith(
          UserAddressModel value, $Res Function(UserAddressModel) _then) =
      _$UserAddressModelCopyWithImpl;
  @useResult
  $Res call(
      {String street,
      String suite,
      String city,
      String zipcode,
      UserAddressGeoModel geo});

  $UserAddressGeoModelCopyWith<$Res> get geo;
}

/// @nodoc
class _$UserAddressModelCopyWithImpl<$Res>
    implements $UserAddressModelCopyWith<$Res> {
  _$UserAddressModelCopyWithImpl(this._self, this._then);

  final UserAddressModel _self;
  final $Res Function(UserAddressModel) _then;

  /// Create a copy of UserAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? suite = null,
    Object? city = null,
    Object? zipcode = null,
    Object? geo = null,
  }) {
    return _then(_self.copyWith(
      street: null == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      suite: null == suite
          ? _self.suite
          : suite // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _self.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      geo: null == geo
          ? _self.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as UserAddressGeoModel,
    ));
  }

  /// Create a copy of UserAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAddressGeoModelCopyWith<$Res> get geo {
    return $UserAddressGeoModelCopyWith<$Res>(_self.geo, (value) {
      return _then(_self.copyWith(geo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserAddressModel implements UserAddressModel {
  _UserAddressModel(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});
  factory _UserAddressModel.fromJson(Map<String, dynamic> json) =>
      _$UserAddressModelFromJson(json);

  @override
  final String street;
  @override
  final String suite;
  @override
  final String city;
  @override
  final String zipcode;
  @override
  final UserAddressGeoModel geo;

  /// Create a copy of UserAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserAddressModelCopyWith<_UserAddressModel> get copyWith =>
      __$UserAddressModelCopyWithImpl<_UserAddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserAddressModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAddressModel &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.suite, suite) || other.suite == suite) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            (identical(other.geo, geo) || other.geo == geo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, street, suite, city, zipcode, geo);

  @override
  String toString() {
    return 'UserAddressModel(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }
}

/// @nodoc
abstract mixin class _$UserAddressModelCopyWith<$Res>
    implements $UserAddressModelCopyWith<$Res> {
  factory _$UserAddressModelCopyWith(
          _UserAddressModel value, $Res Function(_UserAddressModel) _then) =
      __$UserAddressModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String street,
      String suite,
      String city,
      String zipcode,
      UserAddressGeoModel geo});

  @override
  $UserAddressGeoModelCopyWith<$Res> get geo;
}

/// @nodoc
class __$UserAddressModelCopyWithImpl<$Res>
    implements _$UserAddressModelCopyWith<$Res> {
  __$UserAddressModelCopyWithImpl(this._self, this._then);

  final _UserAddressModel _self;
  final $Res Function(_UserAddressModel) _then;

  /// Create a copy of UserAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? street = null,
    Object? suite = null,
    Object? city = null,
    Object? zipcode = null,
    Object? geo = null,
  }) {
    return _then(_UserAddressModel(
      street: null == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      suite: null == suite
          ? _self.suite
          : suite // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _self.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      geo: null == geo
          ? _self.geo
          : geo // ignore: cast_nullable_to_non_nullable
              as UserAddressGeoModel,
    ));
  }

  /// Create a copy of UserAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAddressGeoModelCopyWith<$Res> get geo {
    return $UserAddressGeoModelCopyWith<$Res>(_self.geo, (value) {
      return _then(_self.copyWith(geo: value));
    });
  }
}

// dart format on
