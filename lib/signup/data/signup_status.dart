import 'package:helpme/objects/user.dart';

abstract class SignUpStatus {
  final bool isFirstStage;
  final bool isReady;

  const SignUpStatus({
    required this.isFirstStage,
    this.isReady = false
  });
}

class InitialSignUpStatus extends SignUpStatus {
  const InitialSignUpStatus() : super(isFirstStage: true);
}

class SignUpNicknameLoadingStatus extends SignUpStatus {
  const SignUpNicknameLoadingStatus() : super(isFirstStage: true);
}

class SignUpNicknameNotAvailableStatus extends SignUpStatus {
  const SignUpNicknameNotAvailableStatus() : super(isFirstStage: true);
}

class SignUpNicknameFailedStatus extends SignUpStatus {
  final String state;
  final int code;

  const SignUpNicknameFailedStatus(this.state, this.code) : super(isFirstStage: true);
}

class SignUpNicknamePickedStatus extends SignUpStatus {
  const SignUpNicknamePickedStatus() : super(isFirstStage: false);
}
class SignUpReadyStatus extends SignUpStatus {
  const SignUpReadyStatus() : super(isFirstStage: false, isReady: true);
}

class SignUpLoadingStatus extends SignUpStatus {
  const SignUpLoadingStatus() : super(isFirstStage: false, isReady: true);
}

class SignUpSuccess extends SignUpStatus {
  final User user;
  final String authToken;

  const SignUpSuccess(this.user, this.authToken) : super(isFirstStage: false, isReady: true);
}

class SignUpFailed extends SignUpStatus {
  final String state;
  final int code;

  const SignUpFailed(this.state, this.code) : super(isFirstStage: false, isReady: true);
}
