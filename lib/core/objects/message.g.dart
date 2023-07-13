// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessage _$$_ChatMessageFromJson(Map<String, dynamic> json) =>
    _$_ChatMessage(
      id: json['id'] as String,
      type: json['type'] as int,
      createdAt: json['createdAt'] as int,
      replyTo: json['replyTo'] == null
          ? null
          : ChatMessage.fromJson(json['replyTo'] as Map<String, dynamic>),
      replyToId: json['replyToId'] as String?,
      mentionedUserIds: (json['mentionedUserIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_ChatMessageToJson(_$_ChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'replyTo': instance.replyTo,
      'replyToId': instance.replyToId,
      'mentionedUserIds': instance.mentionedUserIds,
      'content': instance.content,
    };
