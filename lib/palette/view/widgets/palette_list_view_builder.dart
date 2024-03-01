import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/palette_view_model.dart';
import 'paletter_list_item.dart';

class PaletteListViewBuilder extends StatelessWidget {
  const PaletteListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaletteViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: viewModel.palettes.length,
          itemBuilder: (context, index) => PaletterListItem(
            model: viewModel.palettes[index],
          ),
        );
      },
    );
  }
}
