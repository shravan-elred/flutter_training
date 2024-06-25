import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'animation/explicit/card_swipe_example.dart';
import 'animation/explicit/explicit_animation_example.dart';
import 'animation/explicit/physics_animation_example.dart';
import 'animation/explicit/tween_animation_builder_example.dart';
import 'animation/rive/rive_circle_rotate_example.dart';
import 'animation/rive/rive_space_example.dart';

final navigaterKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_training',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
        colorScheme: const ColorScheme.light(),
      ),
      navigatorKey: navigaterKey,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('fr'), // French
      ],
      home: const RiveSpaceExample(),
    );
  }
}
