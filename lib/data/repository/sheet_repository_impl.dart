import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/domain/repository/sheet_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SheetRepositoryImpl implements SheetRepository {
  @override
  Box<Sheet> getSheetsBox() {
    return  Hive.box<Sheet>('sheets');
  }

  @override
  void addSheet({required String name, required int count}) {

  }

  @override
  void deleteSheet() {
    // TODO: implement deleteSheet
  }

  @override
  void updateSheet() {
    // TODO: implement updateSheet
  }
}
