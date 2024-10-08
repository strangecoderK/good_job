import 'package:hive_flutter/hive_flutter.dart';

// Hive 타입 어댑터
part 'sheet.g.dart';

@HiveType(typeId: 1)
class Sheet extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  final int count;

  @HiveField(3)
  int filledCount;

  @HiveField(4)
  bool ableToCheck;

  @HiveField(5)
  DateTime? lastFilledDate;

  Sheet({
    required this.id,
    required this.name,
    required this.count,
    required this.filledCount,
    required this.ableToCheck,
    this.lastFilledDate,
  });
}
