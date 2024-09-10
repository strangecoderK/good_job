import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/domain/repository/sheet_repository.dart';
import 'package:hive/hive.dart';

class SheetRepositoryImpl implements SheetRepository {
  @override
  Box<Sheet> getSheetsBox() {
    return Hive.box('sheets');
  }

  @override
  void addSheet({required String name, required int count}) {
    // TODO: implement addSheet
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
