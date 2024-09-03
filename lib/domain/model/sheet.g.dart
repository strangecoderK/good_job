// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SheetImpl _$$SheetImplFromJson(Map<String, dynamic> json) => _$SheetImpl(
      name: json['name'] as String,
      count: (json['count'] as num).toInt(),
      filledCount: (json['filledCount'] as num).toInt(),
    );

Map<String, dynamic> _$$SheetImplToJson(_$SheetImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'filledCount': instance.filledCount,
    };
