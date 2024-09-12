import 'package:flutter/material.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/domain/model/sticker.dart';
import 'package:good_job/domain/repository/sheet_repository.dart';
import 'package:good_job/domain/repository/sticker_repository.dart';
import 'package:good_job/presentation/component/delete_alert_dialog.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SheetForFifteenViewModel with ChangeNotifier {
  final StickerRepository stickerRepository;
  final SheetRepository sheetRepository;
  Box<Sticker>? stickers;
  Box<Sheet>? sheets;

  SheetForFifteenViewModel({
    required this.stickerRepository,
    required this.sheetRepository,
  }) {
    init();
  }

  void init() {
    stickers = stickerRepository.getStickersBox();
    sheets = sheetRepository.getSheetsBox();
    notifyListeners();
  }

  bool getSticker(String sheetId, int row, int col) {
    final key = '$sheetId$row$col';
    final sticker = stickers!.get(key);
    return sticker?.isSelected ?? false;
  }

  void tapSticker(String sheetId, int row, int col, bool isSelected) {
    final key = '$sheetId$row$col';
    final existingSticker = stickers!.get(key);
    final sheet = sheets!.get(sheetId);

    if (sheet!.ableToCheck == true) {
      if (existingSticker?.isSelected ?? false) {
        return;
      }
      final sticker = Sticker(
        sheetId: sheetId,
        row: row,
        col: col,
        isSelected: isSelected,
        stickerId: 0,
      );
      stickers!.put(key, sticker);
      plusCount(sheetId);
      notifyListeners();
    } else {
      return;
    }
  }

  void plusCount(String sheetId) {
    Sheet? sheet = sheets!.get(sheetId);
    sheet!.filledCount += 1;
    sheet.ableToCheck = false;
    sheet.lastFilledDate = DateTime.now();
    sheets!.put(sheetId, sheet);
  }

  String getImageForPosition(int row, int col) {
    String index = '${row}_$col';
    return 'assets/15_$index.png';
  }

  void checkTodayFilled(String sheetId) {
    Sheet? sheet = sheets!.get(sheetId);
    final date = DateTime.now();
    if (sheet!.lastFilledDate == null) {
      return;
    } else {
      if (sheet.lastFilledDate!.year != date.year ||
          sheet.lastFilledDate!.month != date.month ||
          sheet.lastFilledDate!.day != date.day) {
        sheet.ableToCheck = true;
      }
    }
    sheets!.put(sheetId, sheet);
    notifyListeners();
  }

  bool ableToCheck(String sheetId) {
    final sheet = sheets?.get(sheetId);
    return sheet?.ableToCheck ?? false;
  }

  bool checkCompleted(String sheetId) {
    final sheet = sheets?.get(sheetId);
    return sheet?.count == sheet?.filledCount;
  }

  void deleteSheet(String sheetId) {
    sheets!.delete(sheetId);
    notifyListeners();
  }

  void showDeleteDialog(
    BuildContext context,
    String sheetId,
    VoidCallback cancelOnTap,
    VoidCallback okOnTap,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) => DeleteAlertDialog(
        cancelOnTap: cancelOnTap,
        okOnTap: okOnTap,
      ),
    );
  }
}
