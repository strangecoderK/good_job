import 'package:flutter/material.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/domain/repository/sheet_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainViewModel with ChangeNotifier {
  Box<Sheet>? sheets;
  final SheetRepository repository;

  MainViewModel({
    required this.repository,
  }) {
    init();
  }

  void init() {
    sheets = repository.getSheetsBox();
    notifyListeners();
  }

  void updateSheet() {}

  void deleteSheet() {}
}
