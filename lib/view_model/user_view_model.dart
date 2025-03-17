import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/user_address_geo_model.dart';
import '../model/user_address_model.dart';
import '../model/user_company_model.dart';
import '../model/user_model.dart';

part 'user_view_model.g.dart';

@riverpod
class UserViewModel extends _$UserViewModel {
  final Dio _client = Dio(
    BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
  );

  @override
  Future<List<UserModel>> build() async {
    return _client.get('/users').then<List<UserModel>>(
          (response) => (response.data as List<dynamic>)
              .map((map) => UserModel.fromJson(map))
              .toList(),
        );
  }

  Future<void> addUser() async {
    final userModel = UserModel(
      id: 1,
      name: 'name',
      username: 'username',
      email: 'email',
      phone: 'phone',
      website: 'website',
      address: UserAddressModel(
        street: 'street',
        suite: 'suite',
        city: 'city',
        zipcode: 'zipcode',
        geo: UserAddressGeoModel(lat: 'lat', lng: 'lng'),
      ),
      company: UserCompanyModel(
        name: 'name',
        catchPhrase: 'catchPhrase',
        bs: 'bs',
      ),
    );

    state = AsyncData([...state.value ?? [], userModel]);
  }
}
