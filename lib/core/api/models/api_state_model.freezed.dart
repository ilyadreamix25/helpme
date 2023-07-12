// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiStateModel<T> _$ApiStateModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ApiStateModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiStateModel<T> {
  int get code => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiStateModelCopyWith<T, ApiStateModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiStateModelCopyWith<T, $Res> {
  factory $ApiStateModelCopyWith(
          ApiStateModel<T> value, $Res Function(ApiStateModel<T>) then) =
      _$ApiStateModelCopyWithImpl<T, $Res, ApiStateModel<T>>;
  @useResult
  $Res call({int code, String state, bool hasError, int timestamp, T? data});
}

/// @nodoc
class _$ApiStateModelCopyWithImpl<T, $Res, $Val extends ApiStateModel<T>>
    implements $ApiStateModelCopyWith<T, $Res> {
  _$ApiStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? state = null,
    Object? hasError = null,
    Object? timestamp = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiStateModelCopyWith<T, $Res>
    implements $ApiStateModelCopyWith<T, $Res> {
  factory _$$_ApiStateModelCopyWith(
          _$_ApiStateModel<T> value, $Res Function(_$_ApiStateModel<T>) then) =
      __$$_ApiStateModelCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int code, String state, bool hasError, int timestamp, T? data});
}

/// @nodoc
class __$$_ApiStateModelCopyWithImpl<T, $Res>
    extends _$ApiStateModelCopyWithImpl<T, $Res, _$_ApiStateModel<T>>
    implements _$$_ApiStateModelCopyWith<T, $Res> {
  __$$_ApiStateModelCopyWithImpl(
      _$_ApiStateModel<T> _value, $Res Function(_$_ApiStateModel<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? state = null,
    Object? hasError = null,
    Object? timestamp = null,
    Object? data = freezed,
  }) {
    return _then(_$_ApiStateModel<T>(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_ApiStateModel<T> extends _ApiStateModel<T> {
  const _$_ApiStateModel(
      {required this.code,
      required this.state,
      required this.hasError,
      required this.timestamp,
      this.data})
      : super._();

  factory _$_ApiStateModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_ApiStateModelFromJson(json, fromJsonT);

  @override
  final int code;
  @override
  final String state;
  @override
  final bool hasError;
  @override
  final int timestamp;
  @override
  final T? data;

  @override
  String toString() {
    return 'ApiStateModel<$T>(code: $code, state: $state, hasError: $hasError, timestamp: $timestamp, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiStateModel<T> &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, state, hasError, timestamp,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiStateModelCopyWith<T, _$_ApiStateModel<T>> get copyWith =>
      __$$_ApiStateModelCopyWithImpl<T, _$_ApiStateModel<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_ApiStateModelToJson<T>(this, toJsonT);
  }
}

abstract class _ApiStateModel<T> extends ApiStateModel<T> {
  const factory _ApiStateModel(
      {required final int code,
      required final String state,
      required final bool hasError,
      required final int timestamp,
      final T? data}) = _$_ApiStateModel<T>;
  const _ApiStateModel._() : super._();

  factory _ApiStateModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_ApiStateModel<T>.fromJson;

  @override
  int get code;
  @override
  String get state;
  @override
  bool get hasError;
  @override
  int get timestamp;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ApiStateModelCopyWith<T, _$_ApiStateModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
