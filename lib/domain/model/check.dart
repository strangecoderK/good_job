import 'package:hive_flutter/hive_flutter.dart';

// Hive 타입 어댑터
part 'check.g.dart';

@HiveType(typeId: 2)
class Check extends HiveObject {
  @HiveField(0)
  bool isFirstMake;

  Check({
    required this.isFirstMake,
  });

  @override
  String toString() {
    return 'Check{isFirstMake: $isFirstMake}';
  }
}
