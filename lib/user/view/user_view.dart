import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/user_view_model.dart';
import 'widgets/user_list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(context.read<UserViewModel>().fetchUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.hello),
      ),
      body: const UserListView(),
    );
  }
}
