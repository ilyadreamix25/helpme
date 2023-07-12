import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:helpme/core/api/api_constants.dart';
import 'package:helpme/core/api/api_state.dart';
import 'package:helpme/core/auth/auth_service.dart';
import 'package:helpme/core/utils/log_util.dart';
import 'package:helpme/signin/data/signin_event.dart';
import 'package:helpme/signin/data/signin_repository.dart';
import 'package:helpme/signin/data/signin_state.dart';
import 'package:helpme/signin/data/signin_status.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<SignInPinCodeChanged>((event, emit) => emit(
      state.copyWith(pinCode: event.pinCode)
    ));

    on<SignInReady>((event, emit) => emit(
      state.copyWith(status: const SignInReadyStatus())
    ));

    on<SignInSubmit>((event, emit) => _onSubmit(event, emit));
  }

  void _onSubmit(SignInSubmit event, Emitter<SignInState> emit) async {
    emit(state.copyWith(
      status: const SignInLoadingStatus()
    ));

    if (event.useApple) {
      emit(state.copyWith(
        status: SignInErrorStatus(
          StateCode.serviceUnavailable.name,
          StateCode.serviceUnavailable.index,
        )
      ));
      return;
    }

    final googleSignIn = GoogleSignIn(
      scopes: ['email', 'openid', 'profile'],
      serverClientId: apiServerClientId,
    );

    if (await googleSignIn.isSignedIn()) {
      googleSignIn.signOut().onError((exception, stackTrace) {
        LogUtility.error(
          tag: 'SignInBloc._onSubmit',
          message: exception.toString(),
          stackTrace: stackTrace,
        );
        return;
      });

      googleSignIn.disconnect().onError((exception, stackTrace) {
        LogUtility.error(
          tag: 'SignInBloc._onSubmit',
          message: exception.toString(),
          stackTrace: stackTrace,
        );
        return;
      });
    }

    try {
      final signInResult = await googleSignIn.signIn();
      final auth = await signInResult!.authentication;

      final response = await SignInRepository.signIn(
        pinCode: state.pinCode,
        idToken: auth.idToken!,
      );

      if (!response.isSuccesful) {
        emit(
          state.copyWith(status: SignInErrorStatus(
            response.state,
            response.code,
          ))
        );
        return;
      }

      await AuthService.setAuth(
        authToken: response.data!.authToken,
        lastLogin: response.data!.user.lastSignedInAt,
        pinCode: state.pinCode,
      );

      emit(
        state.copyWith(status: SignInSuccessStatus(
          response.data!.user,
          response.data!.authToken,
        ))
      );
    } catch (exception, stackTrace) {
      LogUtility.error(
        tag: 'SignInBloc._onSubmit',
        message: exception.toString(),
        stackTrace: stackTrace,
      );

      emit(
        state.copyWith(status: const SignInErrorStatus(
          StateCode.unknownState,
          StateCode.unknown,
        ))
      );
    }
  }
}
