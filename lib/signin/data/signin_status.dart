import 'package:helpme/objects/user.dart';

abstract class SignInStatus {
  final bool buttonHidden;
  
  const SignInStatus([this.buttonHidden = true]);
}

class InitialSignInStatus extends SignInStatus {
  const InitialSignInStatus();
}

class SignInReadyStatus extends SignInStatus {
  const SignInReadyStatus() : super(false);
}

class SignInLoadingStatus extends SignInStatus {
  const SignInLoadingStatus() : super(false);
}

class SignInSuccessStatus extends SignInStatus {
  final User user;
  final String authToken;

  const SignInSuccessStatus(this.user, this.authToken) : super(false);
}

class SignInErrorStatus extends SignInStatus {
  final String state;
  final int code;

  const SignInErrorStatus(this.state, this.code) : super(false);
}
