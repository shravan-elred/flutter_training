import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';
import '../../view_model/user_view_model.dart';
import 'user_list_item.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<UserViewModel, List<UserModel>>(
      selector: (_, vm) => vm.users,
      builder: (context, users, child) {
        return ListView.separated(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return UserListItem(user: user);
          },
          separatorBuilder: (_, __) => const Divider(
            height: 1,
          ),
        );
      },
    );
  }
}
