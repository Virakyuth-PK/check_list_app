// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return _TodoModel.fromJson(json);
}

/// @nodoc
mixin _$TodoModel {
  @HiveField(0)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(0)
  set title(String? value) => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(1)
  set description(String? value) => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get isPriority => throw _privateConstructorUsedError;
  @HiveField(2)
  set isPriority(bool value) => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime? get createdDate => throw _privateConstructorUsedError;
  @HiveField(3)
  set createdDate(DateTime? value) => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime? get updatedDate => throw _privateConstructorUsedError;
  @HiveField(4)
  set updatedDate(DateTime? value) => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get isCompleted => throw _privateConstructorUsedError;
  @HiveField(5)
  set isCompleted(bool value) => throw _privateConstructorUsedError;

  /// Serializes this TodoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoModelCopyWith<TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) then) =
      _$TodoModelCopyWithImpl<$Res, TodoModel>;
  @useResult
  $Res call(
      {@HiveField(0) String? title,
      @HiveField(1) String? description,
      @HiveField(2) bool isPriority,
      @HiveField(3) DateTime? createdDate,
      @HiveField(4) DateTime? updatedDate,
      @HiveField(5) bool isCompleted});
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res, $Val extends TodoModel>
    implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? isPriority = null,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isPriority: null == isPriority
          ? _value.isPriority
          : isPriority // ignore: cast_nullable_to_non_nullable
              as bool,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoModelImplCopyWith<$Res>
    implements $TodoModelCopyWith<$Res> {
  factory _$$TodoModelImplCopyWith(
          _$TodoModelImpl value, $Res Function(_$TodoModelImpl) then) =
      __$$TodoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? title,
      @HiveField(1) String? description,
      @HiveField(2) bool isPriority,
      @HiveField(3) DateTime? createdDate,
      @HiveField(4) DateTime? updatedDate,
      @HiveField(5) bool isCompleted});
}

/// @nodoc
class __$$TodoModelImplCopyWithImpl<$Res>
    extends _$TodoModelCopyWithImpl<$Res, _$TodoModelImpl>
    implements _$$TodoModelImplCopyWith<$Res> {
  __$$TodoModelImplCopyWithImpl(
      _$TodoModelImpl _value, $Res Function(_$TodoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? isPriority = null,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? isCompleted = null,
  }) {
    return _then(_$TodoModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isPriority: null == isPriority
          ? _value.isPriority
          : isPriority // ignore: cast_nullable_to_non_nullable
              as bool,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.none)
@HiveType(typeId: 0)
class _$TodoModelImpl implements _TodoModel {
  _$TodoModelImpl(
      {@HiveField(0) this.title,
      @HiveField(1) this.description,
      @HiveField(2) this.isPriority = false,
      @HiveField(3) this.createdDate,
      @HiveField(4) this.updatedDate,
      @HiveField(5) this.isCompleted = false});

  factory _$TodoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoModelImplFromJson(json);

  @override
  @HiveField(0)
  String? title;
  @override
  @HiveField(1)
  String? description;
  @override
  @JsonKey()
  @HiveField(2)
  bool isPriority;
  @override
  @HiveField(3)
  DateTime? createdDate;
  @override
  @HiveField(4)
  DateTime? updatedDate;
  @override
  @JsonKey()
  @HiveField(5)
  bool isCompleted;

  @override
  String toString() {
    return 'TodoModel(title: $title, description: $description, isPriority: $isPriority, createdDate: $createdDate, updatedDate: $updatedDate, isCompleted: $isCompleted)';
  }

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoModelImplCopyWith<_$TodoModelImpl> get copyWith =>
      __$$TodoModelImplCopyWithImpl<_$TodoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoModelImplToJson(
      this,
    );
  }
}

abstract class _TodoModel implements TodoModel {
  factory _TodoModel(
      {@HiveField(0) String? title,
      @HiveField(1) String? description,
      @HiveField(2) bool isPriority,
      @HiveField(3) DateTime? createdDate,
      @HiveField(4) DateTime? updatedDate,
      @HiveField(5) bool isCompleted}) = _$TodoModelImpl;

  factory _TodoModel.fromJson(Map<String, dynamic> json) =
      _$TodoModelImpl.fromJson;

  @override
  @HiveField(0)
  String? get title;
  @HiveField(0)
  set title(String? value);
  @override
  @HiveField(1)
  String? get description;
  @HiveField(1)
  set description(String? value);
  @override
  @HiveField(2)
  bool get isPriority;
  @HiveField(2)
  set isPriority(bool value);
  @override
  @HiveField(3)
  DateTime? get createdDate;
  @HiveField(3)
  set createdDate(DateTime? value);
  @override
  @HiveField(4)
  DateTime? get updatedDate;
  @HiveField(4)
  set updatedDate(DateTime? value);
  @override
  @HiveField(5)
  bool get isCompleted;
  @HiveField(5)
  set isCompleted(bool value);

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoModelImplCopyWith<_$TodoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
