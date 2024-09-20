import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/domain/repository/sheet_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SheetRepositoryImpl implements SheetRepository {
  @override
  Box<Sheet> getSheetsBox() {
    return Hive.box<Sheet>('sheets');
  }
}
