// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
mixin _$Chat {
  String get id => throw _privateConstructorUsedError;
  UserPublic get creator => throw _privateConstructorUsedError;
  List<Topic> get topics => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<ChatMessage>? get lastMessages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call(
      {String id,
      UserPublic creator,
      List<Topic> topics,
      String title,
      bool isHidden,
      bool isPublic,
      bool isVerified,
      int createdAt,
      String? description,
      List<ChatMessage>? lastMessages});

  $UserPublicCopyWith<$Res> get creator;
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creator = null,
    Object? topics = null,
    Object? title = null,
    Object? isHidden = null,
    Object? isPublic = null,
    Object? isVerified = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? lastMessages = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserPublic,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Topic>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessages: freezed == lastMessages
          ? _value.lastMessages
          : lastMessages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPublicCopyWith<$Res> get creator {
    return $UserPublicCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$_ChatCopyWith(_$_Chat value, $Res Function(_$_Chat) then) =
      __$$_ChatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      UserPublic creator,
      List<Topic> topics,
      String title,
      bool isHidden,
      bool isPublic,
      bool isVerified,
      int createdAt,
      String? description,
      List<ChatMessage>? lastMessages});

  @override
  $UserPublicCopyWith<$Res> get creator;
}

/// @nodoc
class __$$_ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res, _$_Chat>
    implements _$$_ChatCopyWith<$Res> {
  __$$_ChatCopyWithImpl(_$_Chat _value, $Res Function(_$_Chat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creator = null,
    Object? topics = null,
    Object? title = null,
    Object? isHidden = null,
    Object? isPublic = null,
    Object? isVerified = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? lastMessages = freezed,
  }) {
    return _then(_$_Chat(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as UserPublic,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Topic>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessages: freezed == lastMessages
          ? _value._lastMessages
          : lastMessages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chat implements _Chat {
  const _$_Chat(
      {required this.id,
      required this.creator,
      required final List<Topic> topics,
      required this.title,
      required this.isHidden,
      required this.isPublic,
      required this.isVerified,
      required this.createdAt,
      this.description,
      final List<ChatMessage>? lastMessages})
      : _topics = topics,
        _lastMessages = lastMessages;

  factory _$_Chat.fromJson(Map<String, dynamic> json) => _$$_ChatFromJson(json);

  @override
  final String id;
  @override
  final UserPublic creator;
  final List<Topic> _topics;
  @override
  List<Topic> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  final String title;
  @override
  final bool isHidden;
  @override
  final bool isPublic;
  @override
  final bool isVerified;
  @override
  final int createdAt;
  @override
  final String? description;
  final List<ChatMessage>? _lastMessages;
  @override
  List<ChatMessage>? get lastMessages {
    final value = _lastMessages;
    if (value == null) return null;
    if (_lastMessages is EqualUnmodifiableListView) return _lastMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Chat(id: $id, creator: $creator, topics: $topics, title: $title, isHidden: $isHidden, isPublic: $isPublic, isVerified: $isVerified, createdAt: $createdAt, description: $description, lastMessages: $lastMessages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chat &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._lastMessages, _lastMessages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      creator,
      const DeepCollectionEquality().hash(_topics),
      title,
      isHidden,
      isPublic,
      isVerified,
      createdAt,
      description,
      const DeepCollectionEquality().hash(_lastMessages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatCopyWith<_$_Chat> get copyWith =>
      __$$_ChatCopyWithImpl<_$_Chat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatToJson(
      this,
    );
  }
}

abstract class _Chat implements Chat {
  const factory _Chat(
      {required final String id,
      required final UserPublic creator,
      required final List<Topic> topics,
      required final String title,
      required final bool isHidden,
      required final bool isPublic,
      required final bool isVerified,
      required final int createdAt,
      final String? description,
      final List<ChatMessage>? lastMessages}) = _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  String get id;
  @override
  UserPublic get creator;
  @override
  List<Topic> get topics;
  @override
  String get title;
  @override
  bool get isHidden;
  @override
  bool get isPublic;
  @override
  bool get isVerified;
  @override
  int get createdAt;
  @override
  String? get description;
  @override
  List<ChatMessage>? get lastMessages;
  @override
  @JsonKey(ignore: true)
  _$$_ChatCopyWith<_$_Chat> get copyWith => throw _privateConstructorUsedError;
}
