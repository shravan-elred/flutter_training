import 'package:flutter/material.dart';

import '../../model/user_model.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image(
          fit: BoxFit.fill,
          image: NetworkImage(user.avatar),
        ),
      ),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email),
      onTap: () {},
    );
  }
}
