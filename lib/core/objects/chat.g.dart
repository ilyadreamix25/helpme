// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$$_ChatFromJson(Map<String, dynamic> json) => _$_Chat(
      id: json['id'] as String,
      creator: UserPublic.fromJson(json['creator'] as Map<String, dynamic>),
      topics: (json['topics'] as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      isHidden: json['isHidden'] as bool,
      isPublic: json['isPublic'] as bool,
      isVerified: json['isVerified'] as bool,
      createdAt: json['createdAt'] as int,
      description: json['description'] as String?,
      lastMessages: (json['lastMessages'] as List<dynamic>?)
          ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'id': instance.id,
      'creator': instance.creator,
      'topics': instance.topics,
      'title': instance.title,
      'isHidden': instance.isHidden,
      'isPublic': instance.isPublic,
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'lastMessages': instance.lastMessages,
    };
