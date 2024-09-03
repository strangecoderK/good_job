// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Sheet _$SheetFromJson(Map<String, dynamic> json) {
  return _Sheet.fromJson(json);
}

/// @nodoc
mixin _$Sheet {
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int get filledCount => throw _privateConstructorUsedError;

  /// Serializes this Sheet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Sheet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SheetCopyWith<Sheet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SheetCopyWith<$Res> {
  factory $SheetCopyWith(Sheet value, $Res Function(Sheet) then) =
      _$SheetCopyWithImpl<$Res, Sheet>;
  @useResult
  $Res call({String name, int count, int filledCount});
}

/// @nodoc
class _$SheetCopyWithImpl<$Res, $Val extends Sheet>
    implements $SheetCopyWith<$Res> {
  _$SheetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sheet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
    Object? filledCount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      filledCount: null == filledCount
          ? _value.filledCount
          : filledCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SheetImplCopyWith<$Res> implements $SheetCopyWith<$Res> {
  factory _$$SheetImplCopyWith(
          _$SheetImpl value, $Res Function(_$SheetImpl) then) =
      __$$SheetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int count, int filledCount});
}

/// @nodoc
class __$$SheetImplCopyWithImpl<$Res>
    extends _$SheetCopyWithImpl<$Res, _$SheetImpl>
    implements _$$SheetImplCopyWith<$Res> {
  __$$SheetImplCopyWithImpl(
      _$SheetImpl _value, $Res Function(_$SheetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Sheet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? count = null,
    Object? filledCount = null,
  }) {
    return _then(_$SheetImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      filledCount: null == filledCount
          ? _value.filledCount
          : filledCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SheetImpl implements _Sheet {
  const _$SheetImpl(
      {required this.name, required this.count, required this.filledCount});

  factory _$SheetImpl.fromJson(Map<String, dynamic> json) =>
      _$$SheetImplFromJson(json);

  @override
  final String name;
  @override
  final int count;
  @override
  final int filledCount;

  @override
  String toString() {
    return 'Sheet(name: $name, count: $count, filledCount: $filledCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SheetImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.filledCount, filledCount) ||
                other.filledCount == filledCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, count, filledCount);

  /// Create a copy of Sheet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SheetImplCopyWith<_$SheetImpl> get copyWith =>
      __$$SheetImplCopyWithImpl<_$SheetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SheetImplToJson(
      this,
    );
  }
}

abstract class _Sheet implements Sheet {
  const factory _Sheet(
      {required final String name,
      required final int count,
      required final int filledCount}) = _$SheetImpl;

  factory _Sheet.fromJson(Map<String, dynamic> json) = _$SheetImpl.fromJson;

  @override
  String get name;
  @override
  int get count;
  @override
  int get filledCount;

  /// Create a copy of Sheet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SheetImplCopyWith<_$SheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
