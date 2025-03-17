import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'view_model/user_view_model.dart';

part 'main.g.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
@riverpod
String helloWorld(Ref ref) {
  return 'Hello world!';
}

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: AddUserFloatingActionButton(),
        appBar: AppBar(title: const Text('Example')),
        body: UserListView(),
      ),
    );
  }
}

class AddUserFloatingActionButton extends ConsumerWidget {
  const AddUserFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        ref.read(userViewModelProvider.notifier).addUser();
      },
    );
  }
}

class UserListView extends ConsumerWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(userViewModelProvider);

    if (vm.hasError) {
      return Center(
        child: Text(vm.error.toString()),
      );
    }
    if (vm.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
      itemCount: vm.requireValue.length,
      itemBuilder: (context, index) {
        final user = vm.requireValue[index];
        return ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(user.name),
          subtitle: Text(user.address.city),
        );
      },
    );
  }
}
