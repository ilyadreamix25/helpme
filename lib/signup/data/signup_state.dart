import 'package:helpme/signup/data/signup_status.dart';

class SignUpState {
  final String nickname;
  final String age;
  final String pin;
  final SignUpStatus status;

  bool get isNicknameValid => RegExp(r'^(?!_+$)(?!^\d)[A-Za-z0-9_]+$').hasMatch(nickname)
    && nickname.length >= 4
    && nickname.length <= 36;
  
  bool get isAgeValid => age == '' || (
    int.parse(age) > 0 && int.parse(age) <= 100
  );

  bool get isPinFinished => pin.length == 4;

  SignUpState({
    this.nickname = '',
    this.age = '',
    this.pin = '',
    this.status = const InitialSignUpStatus(),
  });

  SignUpState copyWith({
    String? nickname,
    String? age,
    String? pin,
    SignUpStatus? status,
  }) => SignUpState(
    nickname: nickname ?? this.nickname,
    age: age ?? this.age,
    pin: pin ?? this.pin,
    status: status ?? this.status,
  );
}
