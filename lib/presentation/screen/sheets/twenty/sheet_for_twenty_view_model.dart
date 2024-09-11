import 'dart:math';

import 'package:flutter/material.dart';
import 'package:good_job/domain/model/sheet.dart';
import 'package:good_job/domain/model/sticker.dart';
import 'package:good_job/domain/repository/sheet_repository.dart';
import 'package:good_job/domain/repository/sticker_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SheetForTwentyViewModel with ChangeNotifier {
  final StickerRepository stickerRepository;
  final SheetRepository sheetRepository;
  Box<Sticker>? stickers;
  Box<Sheet>? sheets;

  SheetForTwentyViewModel({
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
    final stickerId = Random().nextInt(18) + 1;
    final sticker = Sticker(
      sheetId: sheetId,
      row: row,
      col: col,
      isSelected: isSelected,
      stickerId: stickerId,
    );
    stickers!.put(key, sticker);
    notifyListeners();
  }

  void plusCount(String sheetId) {
    Sheet? sheet = sheets!.get(sheetId);
    sheet!.filledCount += 1;
    sheets!.put(sheetId, sheet);
    notifyListeners();
  }

  String getColor(String sheetId, int row, int col) {
    final key = '$sheetId$row$col';
    final sticker = stickers!.get(key);
    return 'assets/${sticker!.stickerId}.png';
  }
}
