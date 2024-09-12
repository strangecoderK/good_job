import 'package:flutter/material.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/domain/repository/sheet_repository.dart';
import 'package:good_job/presentation/screen/make_sheet/make_sheet_state.dart';

class MakeSheetViewModel with ChangeNotifier {
  final SheetRepository repository;

  MakeSheetViewModel({
    required this.repository,
  });

  MakeSheetState _state = const MakeSheetState();

  MakeSheetState get state => _state;

  Future<void> addSheet(String name, int count) async {
    final String id = DateTime.now().toString();
    final Sheet sheet = Sheet(
        id: id, name: name, count: count, filledCount: 0, ableToCheck: true);
    repository.getSheetsBox().put(id, sheet);
    notifyListeners();
  }

  void selectButton(int value) {
    _state = state.copyWith(selectedButton: value);
    notifyListeners();
  }

  String getStickerPath(int value) {
    String stickerPath = '';
    switch (value) {
      case 10:
        stickerPath = 'assets/10_0_1.png';
      case 15:
        stickerPath = 'assets/15_0_0.png';
      case 20:
        stickerPath = 'assets/4.png';
      case 30:
        stickerPath = 'assets/4.png';
    }
    return stickerPath;
  }

  String getStickerName(int value) {
    String stickerName = '';
    switch (value) {
      case 10:
        stickerName = '도넛';
      case 15:
        stickerName = '당구공';
      case 20:
        stickerName = '과일';
      case 30:
        stickerName = '과일';
    }
    return stickerName;
  }
}
