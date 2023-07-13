import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:helpme/core/objects/message.dart';
import 'package:helpme/core/objects/topic.dart';
import 'package:helpme/core/objects/user.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String id,
    required UserPublic creator,
    required List<Topic> topics,
    required String title,
    required bool isHidden,
    required bool isPublic,
    required bool isVerified,
    required int createdAt,
    String? description,
    List<ChatMessage>? lastMessages,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
