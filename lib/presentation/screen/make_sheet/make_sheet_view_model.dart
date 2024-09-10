import 'package:flutter/material.dart';
import 'package:good_job/presentation/screen/make_sheet/make_sheet_state.dart';

class MakeSheetViewModel with ChangeNotifier {
  MakeSheetState _state = const MakeSheetState();

  MakeSheetState get state => _state;

  void MakeSheet({required String name}) {

  }

  void selectButton(int value) {
    _state = state.copyWith(selectedButton: value);
    notifyListeners();
  }
}
