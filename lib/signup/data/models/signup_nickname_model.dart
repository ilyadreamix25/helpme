import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_nickname_model.freezed.dart';
part 'signup_nickname_model.g.dart';

@freezed
class SignUpNicknameModel with _$SignUpNicknameModel {
  const factory SignUpNicknameModel({
    required bool available,
  }) = _SignUpNicknameModel;

  factory SignUpNicknameModel.fromJson(Map<String, dynamic> json) => _$SignUpNicknameModelFromJson(json);
}
