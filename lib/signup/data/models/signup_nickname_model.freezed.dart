// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_nickname_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignUpNicknameModel _$SignUpNicknameModelFromJson(Map<String, dynamic> json) {
  return _SignUpNicknameModel.fromJson(json);
}

/// @nodoc
mixin _$SignUpNicknameModel {
  bool get available => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpNicknameModelCopyWith<SignUpNicknameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpNicknameModelCopyWith<$Res> {
  factory $SignUpNicknameModelCopyWith(
          SignUpNicknameModel value, $Res Function(SignUpNicknameModel) then) =
      _$SignUpNicknameModelCopyWithImpl<$Res, SignUpNicknameModel>;
  @useResult
  $Res call({bool available});
}

/// @nodoc
class _$SignUpNicknameModelCopyWithImpl<$Res, $Val extends SignUpNicknameModel>
    implements $SignUpNicknameModelCopyWith<$Res> {
  _$SignUpNicknameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
  }) {
    return _then(_value.copyWith(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpNicknameModelCopyWith<$Res>
    implements $SignUpNicknameModelCopyWith<$Res> {
  factory _$$_SignUpNicknameModelCopyWith(_$_SignUpNicknameModel value,
          $Res Function(_$_SignUpNicknameModel) then) =
      __$$_SignUpNicknameModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool available});
}

/// @nodoc
class __$$_SignUpNicknameModelCopyWithImpl<$Res>
    extends _$SignUpNicknameModelCopyWithImpl<$Res, _$_SignUpNicknameModel>
    implements _$$_SignUpNicknameModelCopyWith<$Res> {
  __$$_SignUpNicknameModelCopyWithImpl(_$_SignUpNicknameModel _value,
      $Res Function(_$_SignUpNicknameModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
  }) {
    return _then(_$_SignUpNicknameModel(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignUpNicknameModel implements _SignUpNicknameModel {
  const _$_SignUpNicknameModel({required this.available});

  factory _$_SignUpNicknameModel.fromJson(Map<String, dynamic> json) =>
      _$$_SignUpNicknameModelFromJson(json);

  @override
  final bool available;

  @override
  String toString() {
    return 'SignUpNicknameModel(available: $available)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpNicknameModel &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, available);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpNicknameModelCopyWith<_$_SignUpNicknameModel> get copyWith =>
      __$$_SignUpNicknameModelCopyWithImpl<_$_SignUpNicknameModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignUpNicknameModelToJson(
      this,
    );
  }
}

abstract class _SignUpNicknameModel implements SignUpNicknameModel {
  const factory _SignUpNicknameModel({required final bool available}) =
      _$_SignUpNicknameModel;

  factory _SignUpNicknameModel.fromJson(Map<String, dynamic> json) =
      _$_SignUpNicknameModel.fromJson;

  @override
  bool get available;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpNicknameModelCopyWith<_$_SignUpNicknameModel> get copyWith =>
      throw _privateConstructorUsedError;
}
