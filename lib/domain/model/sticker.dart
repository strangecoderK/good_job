import 'package:hive_flutter/hive_flutter.dart';

// Hive 타입 어댑터
part 'sticker.g.dart';

@HiveType(typeId: 0)
class Sticker extends HiveObject {
  @HiveField(0)
  final int row;

  @HiveField(1)
  final int col;

  @HiveField(2)
  bool isSelected;

  Sticker({
    required this.row,
    required this.col,
    required this.isSelected,
  });
}
