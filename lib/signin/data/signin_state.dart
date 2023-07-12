import 'package:helpme/signin/data/signin_status.dart';

class SignInState {
  final String pinCode;
  final SignInStatus status;

  bool get isPinCodeFinished => pinCode.length == 4;

  SignInState({
    this.pinCode = '',
    this.status = const InitialSignInStatus(),
  });

  SignInState copyWith({
    String? pinCode,
    SignInStatus? status
  }) => SignInState(
    pinCode: pinCode ?? this.pinCode,
    status: status ?? this.status,
  );
}
