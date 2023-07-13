// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Topic _$$_TopicFromJson(Map<String, dynamic> json) => _$_Topic(
      id: json['id'] as String,
      name: json['name'] as String,
      isReadOnly: json['isReadOnly'] as bool,
      createdAt: json['createdAt'] as int,
    );

Map<String, dynamic> _$$_TopicToJson(_$_Topic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isReadOnly': instance.isReadOnly,
      'createdAt': instance.createdAt,
    };
