import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/palette_view_model.dart';
import 'widgets/palette_list_view_builder.dart';

class PaletteScreen extends StatefulWidget {
  const PaletteScreen({super.key});

  @override
  State<PaletteScreen> createState() => _PaletteScreenState();
}

class _PaletteScreenState extends State<PaletteScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.microtask(
      () => context.read<PaletteViewModel>().fetchPalettes(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palettes'),
      ),
      body: const PaletteListViewBuilder(),
    );
  }
}
