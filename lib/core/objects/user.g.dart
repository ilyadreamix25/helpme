// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      isBanned: json['isBanned'] as bool,
      role: json['role'] as int,
      createdAt: json['createdAt'] as int,
      lastSignedInAt: json['lastSignedInAt'] as int,
      nickname: json['nickname'] as String,
      isHidden: json['isHidden'] as bool,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'isBanned': instance.isBanned,
      'role': instance.role,
      'createdAt': instance.createdAt,
      'lastSignedInAt': instance.lastSignedInAt,
      'nickname': instance.nickname,
      'isHidden': instance.isHidden,
      'age': instance.age,
    };
