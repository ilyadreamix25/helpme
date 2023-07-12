abstract class SignUpEvent {}

class SignUpNicknameChanged extends SignUpEvent {
  final String nickname;

  SignUpNicknameChanged(this.nickname);
}

class SignUpAgeChanged extends SignUpEvent {
  final String age;

  SignUpAgeChanged(this.age);
}

class SignUpNicknamePicked extends SignUpEvent {}

class SignUpPinChanged extends SignUpEvent {
  final String pin;

  SignUpPinChanged(this.pin); 
}

class SignUpReady extends SignUpEvent {}

class SignUpSubmit extends SignUpEvent {
  final bool useApple;

  SignUpSubmit([this.useApple = false]);
}
