import 'package:freezed_annotation/freezed_annotation.dart';

part 'sheet.freezed.dart';

part 'sheet.g.dart';

@freezed
class Sheet with _$Sheet {
  const factory Sheet({
    required String name,
    required int count,
    required int filledCount,
  }) = _Sheet;

  factory Sheet.fromJson(Map<String, Object?> json) => _$SheetFromJson(json);
}