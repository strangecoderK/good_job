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
}
