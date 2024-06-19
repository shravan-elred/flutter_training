import 'dart:math';
import 'package:flutter/material.dart';

import '../bloc/cart_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final _bloc = CartBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive Programming'),
        actions: [
          StreamBuilder<int>(
            stream: _bloc.itemCount,
            initialData: 0,
            builder: (_, snapshot) {
              return Badge.count(
                isLabelVisible: snapshot.data! > 0,
                largeSize: 20,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                count: snapshot.data!,
                child: IconButton(
                  onPressed: _bloc.clearCart,
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => _bloc.addItem('Item ${index + 1}'),
            child: Ink(
              height: 100,
              color: Color(
                (Random().nextDouble() * 0xFFFFFF).toInt(),
              ).withOpacity(0.2),
              child: Center(
                child: Text('Item ${index + 1}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
