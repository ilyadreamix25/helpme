import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserPrivate with _$UserPrivate {
  const factory UserPrivate({
    required String id,
    required bool isBanned,
    required int role,
    required int createdAt,
    required int lastSignedInAt,
    required String nickname,
    required bool isHidden,
    required int lastOnlineAt,
    int? age,
  }) = _UserPrivate;

  factory UserPrivate.fromJson(Map<String, dynamic> json) => _$UserPrivateFromJson(json);
}

@freezed
class UserPublic with _$UserPublic {
  const factory UserPublic({
    required String id,
    required bool isBanned,
    required int role,
    required int createdAt,
    required String nickname,
    required bool isHidden,
    required int lastOnlineAt,
  }) = _UserPublic;

  factory UserPublic.fromJson(Map<String, dynamic> json) => _$UserPublicFromJson(json);
}
