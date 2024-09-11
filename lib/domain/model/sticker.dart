import 'package:hive_flutter/hive_flutter.dart';

// Hive 타입 어댑터
part 'sticker.g.dart';

@HiveType(typeId: 0)
class Sticker extends HiveObject {
  @HiveField(0)
  final String sheetId;

  @HiveField(1)
  final int row;

  @HiveField(2)
  final int col;

  @HiveField(3)
  bool isSelected;

  @HiveField(4)
  int stickerId;

  Sticker({
    required this.sheetId,
    required this.row,
    required this.col,
    required this.isSelected,
    required this.stickerId,
  });
}
