abstract class SignInEvent {
  const SignInEvent();
}

class SignInPinCodeChanged extends SignInEvent {
  final String pinCode;

  const SignInPinCodeChanged(this.pinCode);  
}

class SignInReady extends SignInEvent {
  const SignInReady();
}

class SignInSubmit extends SignInEvent {
  final bool useApple;

  const SignInSubmit([this.useApple = false]);
}
