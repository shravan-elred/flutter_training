import 'dart:collection';
import 'dart:developer';
import 'package:flutter/material.dart';

import '../model/palette_model.dart';
import '../service/palette_remote_service.dart';

class PaletteViewModel extends ChangeNotifier {
  List<PaletteModel> _palettes = [];
  UnmodifiableListView<PaletteModel> get palettes =>
      UnmodifiableListView(_palettes);

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  final PaletteRemoteService service = PaletteRemoteServiceImpl();

  void fetchPalettes() async {
    try {
      _setLoading(true);
      final response = await service.getPalettes();
      _palettes = response.data;
    } catch (e, s) {
      log('fetchPalettes', name: '$runtimeType', error: e, stackTrace: s);
    } finally {
      _setLoading(false);
    }
  }
}
