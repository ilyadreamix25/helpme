// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserPrivate _$$_UserPrivateFromJson(Map<String, dynamic> json) =>
    _$_UserPrivate(
      id: json['id'] as String,
      isBanned: json['isBanned'] as bool,
      role: json['role'] as int,
      createdAt: json['createdAt'] as int,
      lastSignedInAt: json['lastSignedInAt'] as int,
      nickname: json['nickname'] as String,
      isHidden: json['isHidden'] as bool,
      lastOnlineAt: json['lastOnlineAt'] as int,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$$_UserPrivateToJson(_$_UserPrivate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isBanned': instance.isBanned,
      'role': instance.role,
      'createdAt': instance.createdAt,
      'lastSignedInAt': instance.lastSignedInAt,
      'nickname': instance.nickname,
      'isHidden': instance.isHidden,
      'lastOnlineAt': instance.lastOnlineAt,
      'age': instance.age,
    };

_$_UserPublic _$$_UserPublicFromJson(Map<String, dynamic> json) =>
    _$_UserPublic(
      id: json['id'] as String,
      isBanned: json['isBanned'] as bool,
      role: json['role'] as int,
      createdAt: json['createdAt'] as int,
      nickname: json['nickname'] as String,
      isHidden: json['isHidden'] as bool,
      lastOnlineAt: json['lastOnlineAt'] as int,
    );

Map<String, dynamic> _$$_UserPublicToJson(_$_UserPublic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isBanned': instance.isBanned,
      'role': instance.role,
      'createdAt': instance.createdAt,
      'nickname': instance.nickname,
      'isHidden': instance.isHidden,
      'lastOnlineAt': instance.lastOnlineAt,
    };
