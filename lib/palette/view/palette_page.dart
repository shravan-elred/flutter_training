import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/palette_view_model.dart';
import 'palette_screen.dart';

class PalettePage extends StatelessWidget {
  const PalettePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaletteViewModel(),
      child: const PaletteScreen(),
    );
  }
}
