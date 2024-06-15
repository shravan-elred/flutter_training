import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/user_view_model.dart';
import 'user_view.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
      create: (_) => UserViewModel(),
      child: const UserView(),
    );
  }
}
