// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPrivate _$UserPrivateFromJson(Map<String, dynamic> json) {
  return _UserPrivate.fromJson(json);
}

/// @nodoc
mixin _$UserPrivate {
  String get id => throw _privateConstructorUsedError;
  bool get isBanned => throw _privateConstructorUsedError;
  int get role => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  int get lastSignedInAt => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  int get lastOnlineAt => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPrivateCopyWith<UserPrivate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPrivateCopyWith<$Res> {
  factory $UserPrivateCopyWith(
          UserPrivate value, $Res Function(UserPrivate) then) =
      _$UserPrivateCopyWithImpl<$Res, UserPrivate>;
  @useResult
  $Res call(
      {String id,
      bool isBanned,
      int role,
      int createdAt,
      int lastSignedInAt,
      String nickname,
      bool isHidden,
      int lastOnlineAt,
      int? age});
}

/// @nodoc
class _$UserPrivateCopyWithImpl<$Res, $Val extends UserPrivate>
    implements $UserPrivateCopyWith<$Res> {
  _$UserPrivateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isBanned = null,
    Object? role = null,
    Object? createdAt = null,
    Object? lastSignedInAt = null,
    Object? nickname = null,
    Object? isHidden = null,
    Object? lastOnlineAt = null,
    Object? age = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastSignedInAt: null == lastSignedInAt
          ? _value.lastSignedInAt
          : lastSignedInAt // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      lastOnlineAt: null == lastOnlineAt
          ? _value.lastOnlineAt
          : lastOnlineAt // ignore: cast_nullable_to_non_nullable
              as int,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPrivateCopyWith<$Res>
    implements $UserPrivateCopyWith<$Res> {
  factory _$$_UserPrivateCopyWith(
          _$_UserPrivate value, $Res Function(_$_UserPrivate) then) =
      __$$_UserPrivateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isBanned,
      int role,
      int createdAt,
      int lastSignedInAt,
      String nickname,
      bool isHidden,
      int lastOnlineAt,
      int? age});
}

/// @nodoc
class __$$_UserPrivateCopyWithImpl<$Res>
    extends _$UserPrivateCopyWithImpl<$Res, _$_UserPrivate>
    implements _$$_UserPrivateCopyWith<$Res> {
  __$$_UserPrivateCopyWithImpl(
      _$_UserPrivate _value, $Res Function(_$_UserPrivate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isBanned = null,
    Object? role = null,
    Object? createdAt = null,
    Object? lastSignedInAt = null,
    Object? nickname = null,
    Object? isHidden = null,
    Object? lastOnlineAt = null,
    Object? age = freezed,
  }) {
    return _then(_$_UserPrivate(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastSignedInAt: null == lastSignedInAt
          ? _value.lastSignedInAt
          : lastSignedInAt // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      lastOnlineAt: null == lastOnlineAt
          ? _value.lastOnlineAt
          : lastOnlineAt // ignore: cast_nullable_to_non_nullable
              as int,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserPrivate implements _UserPrivate {
  const _$_UserPrivate(
      {required this.id,
      required this.isBanned,
      required this.role,
      required this.createdAt,
      required this.lastSignedInAt,
      required this.nickname,
      required this.isHidden,
      required this.lastOnlineAt,
      this.age});

  factory _$_UserPrivate.fromJson(Map<String, dynamic> json) =>
      _$$_UserPrivateFromJson(json);

  @override
  final String id;
  @override
  final bool isBanned;
  @override
  final int role;
  @override
  final int createdAt;
  @override
  final int lastSignedInAt;
  @override
  final String nickname;
  @override
  final bool isHidden;
  @override
  final int lastOnlineAt;
  @override
  final int? age;

  @override
  String toString() {
    return 'UserPrivate(id: $id, isBanned: $isBanned, role: $role, createdAt: $createdAt, lastSignedInAt: $lastSignedInAt, nickname: $nickname, isHidden: $isHidden, lastOnlineAt: $lastOnlineAt, age: $age)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPrivate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isBanned, isBanned) ||
                other.isBanned == isBanned) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastSignedInAt, lastSignedInAt) ||
                other.lastSignedInAt == lastSignedInAt) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.lastOnlineAt, lastOnlineAt) ||
                other.lastOnlineAt == lastOnlineAt) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, isBanned, role, createdAt,
      lastSignedInAt, nickname, isHidden, lastOnlineAt, age);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPrivateCopyWith<_$_UserPrivate> get copyWith =>
      __$$_UserPrivateCopyWithImpl<_$_UserPrivate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPrivateToJson(
      this,
    );
  }
}

abstract class _UserPrivate implements UserPrivate {
  const factory _UserPrivate(
      {required final String id,
      required final bool isBanned,
      required final int role,
      required final int createdAt,
      required final int lastSignedInAt,
      required final String nickname,
      required final bool isHidden,
      required final int lastOnlineAt,
      final int? age}) = _$_UserPrivate;

  factory _UserPrivate.fromJson(Map<String, dynamic> json) =
      _$_UserPrivate.fromJson;

  @override
  String get id;
  @override
  bool get isBanned;
  @override
  int get role;
  @override
  int get createdAt;
  @override
  int get lastSignedInAt;
  @override
  String get nickname;
  @override
  bool get isHidden;
  @override
  int get lastOnlineAt;
  @override
  int? get age;
  @override
  @JsonKey(ignore: true)
  _$$_UserPrivateCopyWith<_$_UserPrivate> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPublic _$UserPublicFromJson(Map<String, dynamic> json) {
  return _UserPublic.fromJson(json);
}

/// @nodoc
mixin _$UserPublic {
  String get id => throw _privateConstructorUsedError;
  bool get isBanned => throw _privateConstructorUsedError;
  int get role => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  int get lastOnlineAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPublicCopyWith<UserPublic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPublicCopyWith<$Res> {
  factory $UserPublicCopyWith(
          UserPublic value, $Res Function(UserPublic) then) =
      _$UserPublicCopyWithImpl<$Res, UserPublic>;
  @useResult
  $Res call(
      {String id,
      bool isBanned,
      int role,
      int createdAt,
      String nickname,
      bool isHidden,
      int lastOnlineAt});
}

/// @nodoc
class _$UserPublicCopyWithImpl<$Res, $Val extends UserPublic>
    implements $UserPublicCopyWith<$Res> {
  _$UserPublicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isBanned = null,
    Object? role = null,
    Object? createdAt = null,
    Object? nickname = null,
    Object? isHidden = null,
    Object? lastOnlineAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      lastOnlineAt: null == lastOnlineAt
          ? _value.lastOnlineAt
          : lastOnlineAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPublicCopyWith<$Res>
    implements $UserPublicCopyWith<$Res> {
  factory _$$_UserPublicCopyWith(
          _$_UserPublic value, $Res Function(_$_UserPublic) then) =
      __$$_UserPublicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isBanned,
      int role,
      int createdAt,
      String nickname,
      bool isHidden,
      int lastOnlineAt});
}

/// @nodoc
class __$$_UserPublicCopyWithImpl<$Res>
    extends _$UserPublicCopyWithImpl<$Res, _$_UserPublic>
    implements _$$_UserPublicCopyWith<$Res> {
  __$$_UserPublicCopyWithImpl(
      _$_UserPublic _value, $Res Function(_$_UserPublic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isBanned = null,
    Object? role = null,
    Object? createdAt = null,
    Object? nickname = null,
    Object? isHidden = null,
    Object? lastOnlineAt = null,
  }) {
    return _then(_$_UserPublic(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isBanned: null == isBanned
          ? _value.isBanned
          : isBanned // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      lastOnlineAt: null == lastOnlineAt
          ? _value.lastOnlineAt
          : lastOnlineAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserPublic implements _UserPublic {
  const _$_UserPublic(
      {required this.id,
      required this.isBanned,
      required this.role,
      required this.createdAt,
      required this.nickname,
      required this.isHidden,
      required this.lastOnlineAt});

  factory _$_UserPublic.fromJson(Map<String, dynamic> json) =>
      _$$_UserPublicFromJson(json);

  @override
  final String id;
  @override
  final bool isBanned;
  @override
  final int role;
  @override
  final int createdAt;
  @override
  final String nickname;
  @override
  final bool isHidden;
  @override
  final int lastOnlineAt;

  @override
  String toString() {
    return 'UserPublic(id: $id, isBanned: $isBanned, role: $role, createdAt: $createdAt, nickname: $nickname, isHidden: $isHidden, lastOnlineAt: $lastOnlineAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPublic &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isBanned, isBanned) ||
                other.isBanned == isBanned) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.lastOnlineAt, lastOnlineAt) ||
                other.lastOnlineAt == lastOnlineAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, isBanned, role, createdAt,
      nickname, isHidden, lastOnlineAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPublicCopyWith<_$_UserPublic> get copyWith =>
      __$$_UserPublicCopyWithImpl<_$_UserPublic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPublicToJson(
      this,
    );
  }
}

abstract class _UserPublic implements UserPublic {
  const factory _UserPublic(
      {required final String id,
      required final bool isBanned,
      required final int role,
      required final int createdAt,
      required final String nickname,
      required final bool isHidden,
      required final int lastOnlineAt}) = _$_UserPublic;

  factory _UserPublic.fromJson(Map<String, dynamic> json) =
      _$_UserPublic.fromJson;

  @override
  String get id;
  @override
  bool get isBanned;
  @override
  int get role;
  @override
  int get createdAt;
  @override
  String get nickname;
  @override
  bool get isHidden;
  @override
  int get lastOnlineAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserPublicCopyWith<_$_UserPublic> get copyWith =>
      throw _privateConstructorUsedError;
}
