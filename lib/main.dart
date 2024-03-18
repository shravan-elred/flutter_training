import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'counter/view/proxy_provider/proxy_provider_page.dart';
import 'future/test_page.dart';
import 'local/screen_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_training',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      home: const ScreenOne(),
    );
  }
}
