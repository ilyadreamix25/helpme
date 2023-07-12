import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:helpme/objects/user.dart';

part 'signup_model.freezed.dart';
part 'signup_model.g.dart';

@freezed
class SignUpModel with _$SignUpModel {
  const factory SignUpModel({
    required String authToken,
    required User user,
  }) = _SignUpModel;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => _$SignUpModelFromJson(json);
}
