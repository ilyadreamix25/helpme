// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  String get id => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  ChatMessage? get replyTo => throw _privateConstructorUsedError;
  String? get replyToId => throw _privateConstructorUsedError;
  List<String>? get mentionedUserIds => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call(
      {String id,
      int type,
      int createdAt,
      ChatMessage? replyTo,
      String? replyToId,
      List<String>? mentionedUserIds,
      String? content});

  $ChatMessageCopyWith<$Res>? get replyTo;
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? createdAt = null,
    Object? replyTo = freezed,
    Object? replyToId = freezed,
    Object? mentionedUserIds = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as ChatMessage?,
      replyToId: freezed == replyToId
          ? _value.replyToId
          : replyToId // ignore: cast_nullable_to_non_nullable
              as String?,
      mentionedUserIds: freezed == mentionedUserIds
          ? _value.mentionedUserIds
          : mentionedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatMessageCopyWith<$Res>? get replyTo {
    if (_value.replyTo == null) {
      return null;
    }

    return $ChatMessageCopyWith<$Res>(_value.replyTo!, (value) {
      return _then(_value.copyWith(replyTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatMessageCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$_ChatMessageCopyWith(
          _$_ChatMessage value, $Res Function(_$_ChatMessage) then) =
      __$$_ChatMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int type,
      int createdAt,
      ChatMessage? replyTo,
      String? replyToId,
      List<String>? mentionedUserIds,
      String? content});

  @override
  $ChatMessageCopyWith<$Res>? get replyTo;
}

/// @nodoc
class __$$_ChatMessageCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$_ChatMessage>
    implements _$$_ChatMessageCopyWith<$Res> {
  __$$_ChatMessageCopyWithImpl(
      _$_ChatMessage _value, $Res Function(_$_ChatMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? createdAt = null,
    Object? replyTo = freezed,
    Object? replyToId = freezed,
    Object? mentionedUserIds = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_ChatMessage(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      replyTo: freezed == replyTo
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as ChatMessage?,
      replyToId: freezed == replyToId
          ? _value.replyToId
          : replyToId // ignore: cast_nullable_to_non_nullable
              as String?,
      mentionedUserIds: freezed == mentionedUserIds
          ? _value._mentionedUserIds
          : mentionedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatMessage implements _ChatMessage {
  const _$_ChatMessage(
      {required this.id,
      required this.type,
      required this.createdAt,
      this.replyTo,
      this.replyToId,
      final List<String>? mentionedUserIds,
      this.content})
      : _mentionedUserIds = mentionedUserIds;

  factory _$_ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$$_ChatMessageFromJson(json);

  @override
  final String id;
  @override
  final int type;
  @override
  final int createdAt;
  @override
  final ChatMessage? replyTo;
  @override
  final String? replyToId;
  final List<String>? _mentionedUserIds;
  @override
  List<String>? get mentionedUserIds {
    final value = _mentionedUserIds;
    if (value == null) return null;
    if (_mentionedUserIds is EqualUnmodifiableListView)
      return _mentionedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? content;

  @override
  String toString() {
    return 'ChatMessage(id: $id, type: $type, createdAt: $createdAt, replyTo: $replyTo, replyToId: $replyToId, mentionedUserIds: $mentionedUserIds, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.replyTo, replyTo) || other.replyTo == replyTo) &&
            (identical(other.replyToId, replyToId) ||
                other.replyToId == replyToId) &&
            const DeepCollectionEquality()
                .equals(other._mentionedUserIds, _mentionedUserIds) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      createdAt,
      replyTo,
      replyToId,
      const DeepCollectionEquality().hash(_mentionedUserIds),
      content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatMessageCopyWith<_$_ChatMessage> get copyWith =>
      __$$_ChatMessageCopyWithImpl<_$_ChatMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatMessageToJson(
      this,
    );
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage(
      {required final String id,
      required final int type,
      required final int createdAt,
      final ChatMessage? replyTo,
      final String? replyToId,
      final List<String>? mentionedUserIds,
      final String? content}) = _$_ChatMessage;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$_ChatMessage.fromJson;

  @override
  String get id;
  @override
  int get type;
  @override
  int get createdAt;
  @override
  ChatMessage? get replyTo;
  @override
  String? get replyToId;
  @override
  List<String>? get mentionedUserIds;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$_ChatMessageCopyWith<_$_ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
