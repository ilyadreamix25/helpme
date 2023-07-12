// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiStateModel<T> _$$_ApiStateModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_ApiStateModel<T>(
      code: json['code'] as int,
      state: json['state'] as String,
      hasError: json['hasError'] as bool,
      timestamp: json['timestamp'] as int,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$$_ApiStateModelToJson<T>(
  _$_ApiStateModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'state': instance.state,
      'hasError': instance.hasError,
      'timestamp': instance.timestamp,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
