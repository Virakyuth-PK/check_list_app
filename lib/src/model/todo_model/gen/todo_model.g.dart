// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../todo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoModelImplAdapter extends TypeAdapter<_$TodoModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$TodoModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TodoModelImpl(
      title: fields[0] as String?,
      description: fields[1] as String?,
      isPriority: fields[2] as bool,
      createdDate: fields[3] as DateTime?,
      updatedDate: fields[4] as DateTime?,
      isCompleted: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$TodoModelImpl obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.isPriority)
      ..writeByte(3)
      ..write(obj.createdDate)
      ..writeByte(4)
      ..write(obj.updatedDate)
      ..writeByte(5)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      title: json['title'] as String?,
      description: json['description'] as String?,
      isPriority: json['isPriority'] as bool? ?? false,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'isPriority': instance.isPriority,
      'createdDate': instance.createdDate?.toIso8601String(),
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'isCompleted': instance.isCompleted,
    };
