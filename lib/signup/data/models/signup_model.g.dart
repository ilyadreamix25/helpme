// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignUpModel _$$_SignUpModelFromJson(Map<String, dynamic> json) =>
    _$_SignUpModel(
      authToken: json['authToken'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SignUpModelToJson(_$_SignUpModel instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
      'user': instance.user,
    };
