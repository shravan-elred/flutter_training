import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mixin/example.dart';
import 'screen_one.dart';
import 'singleton/singleton1.dart';
import 'singleton/singleton2.dart';
import 'singleton/singleton3.dart';
import 'singleton/singleton4.dart';
import 'extension/example.dart';

void main() {
  log('---Singleton---');
  final Singleton1 s1a = Singleton1.getInstance();
  log('s1a : ${s1a.hashCode}');
  final Singleton1 s1b = Singleton1.getInstance();
  log('s1b : ${s1b.hashCode}');

  final Singleton2 s2a = Singleton2.instance;
  log('s2a : ${s2a.hashCode}');
  final Singleton2 s2b = Singleton2.instance;
  log('s2b : ${s2b.hashCode}');

  final Singleton3 s3a = Singleton3();
  log('s3a : ${s3a.hashCode}');
  final Singleton3 s3b = Singleton3();
  log('s3b : ${s3b.hashCode}');

  final Singleton4 s4a = Singleton4.instance;
  log('s4a : ${s4a.hashCode}');
  final Singleton4 s4b = Singleton4.instance;
  log('s4b : ${s4b.hashCode}');

  log('---Mixin---');
  final Dancer dancer = Dancer();
  dancer.dance();
  final Singer singer = Singer();
  singer.sing();
  final Musician musician = Musician();
  musician.dance();
  musician.sing();
  musician.perform();
  final Entertainer entertainer = Entertainer();
  entertainer.dance();
  entertainer.sing();
  entertainer.perform();
  entertainer.entertain();

  log('---Extension---');
  final Iterable<int> numbers = [1, 2, 3];
  log(numbers.firstOrNull.toString());
  log(numbers[2].toString());
  const String name = 'hello, my name is shravan chilka';
  log(name.capitalizeFirst());
  log(name.titleCase());

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
