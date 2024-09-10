import 'package:good_job/domain/model/sheet.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract interface class SheetRepository {
  Box<Sheet> getSheetsBox();

  void addSheet({required String name, required int count});

  void updateSheet();

  void deleteSheet();
}
