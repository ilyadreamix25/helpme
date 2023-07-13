import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_state_model.freezed.dart';
part 'api_state_model.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiStateModel<T> with _$ApiStateModel<T> {
  const ApiStateModel._();

  const factory ApiStateModel({
    required int code,
    required String state,
    required bool hasError,
    required int timestamp,
    T? data,
  }) = _ApiStateModel<T>;

  factory ApiStateModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiStateModelFromJson(json, fromJsonT);

  bool get isSuccessful => code == 0;
}
