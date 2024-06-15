import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../service/user_remote_service.dart';

class UserViewModel extends ChangeNotifier {
  final _remoteService = UserRemoteService();

  List<UserModel> _users = [];

  UnmodifiableListView<UserModel> get users => UnmodifiableListView(_users);

  void fetchUsers() async {
    final response = await _remoteService.getAllUsers();
    if (response != null) {
      _users = response.data;
      log(_users.length.toString());
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _remoteService.dispose();
    super.dispose();
  }
}
