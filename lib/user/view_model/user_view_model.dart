import 'dart:collection';
import 'dart:developer';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

import '../../main.dart';
import '../model/user_model.dart';
import '../service/user_remote_service.dart';

class UserViewModel extends ChangeNotifier {
  final _remoteService = UserRemoteService();

  List<UserModel> _users = [];

  UnmodifiableListView<UserModel> get users => UnmodifiableListView(_users);
  final _workManager = Workmanager();

  void init() {
    _workManager.initialize(callbackDispatcher);
    _workManager.registerOneOffTask(
      'fetchUsers-1',
      'fetchUsers',
      initialDelay: const Duration(seconds: 5),
    );
  }

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

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    if (taskName == 'fetchUsers') {
      navigaterKey.currentContext?.read<UserViewModel>().fetchUsers();
      return true;
    }
    return false;
  });
}
