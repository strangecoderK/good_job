import 'package:freezed_annotation/freezed_annotation.dart';

part 'make_sheet_state.freezed.dart';

part 'make_sheet_state.g.dart';

@freezed
class MakeSheetState with _$MakeSheetState {
  const factory MakeSheetState({
    int? selectedButton,
  }) = _MakeSheetState;

  factory MakeSheetState.fromJson(Map<String, Object?> json) => _$MakeSheetStateFromJson(json);
}