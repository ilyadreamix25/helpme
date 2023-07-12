import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:helpme/core/api/api_constants.dart';
import 'package:helpme/core/api/api_state.dart';
import 'package:helpme/core/auth/auth_service.dart';
import 'package:helpme/signup/data/signup_event.dart';
import 'package:helpme/signup/data/signup_repository.dart';
import 'package:helpme/signup/data/signup_state.dart';
import 'package:helpme/signup/data/signup_status.dart';
import 'package:helpme/core/utils/log_util.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<SignUpNicknameChanged>((event, emit) => emit(
      state.copyWith(nickname: event.nickname)
    ));

    on<SignUpAgeChanged>((event, emit) => emit(
      state.copyWith(age: event.age)
    ));

    on<SignUpNicknamePicked>((event, emit) => _onSignUpNicknamePicked(event, emit));

    on<SignUpPinChanged>((event, emit) => emit(
      state.copyWith(pin: event.pin)
    ));

    on<SignUpReady>((event, emit) => emit(
      state.copyWith(status: const SignUpReadyStatus())
    ));
    
    on<SignUpSubmit>((event, emit) => _onSignUpSubmit(event, emit));
  }

  void _onSignUpNicknamePicked(SignUpNicknamePicked event, Emitter<SignUpState> emit) async {
    emit(
      state.copyWith(status: const SignUpNicknameLoadingStatus())
    );

    try {
      final nicknameAvailableResponse = await SignUpRepository.checkNicknameAvailability(state.nickname);
    
      if (nicknameAvailableResponse.code != 0) {
        emit(
          state.copyWith(status: SignUpNicknameFailedStatus(nicknameAvailableResponse.state, nicknameAvailableResponse.code))
        );
        return;
      }

      if (nicknameAvailableResponse.data!.available == true) {
        emit(
          state.copyWith(status: const SignUpNicknamePickedStatus())
        );
      } else {
        emit(
          state.copyWith(status: const SignUpNicknameNotAvailableStatus())
        );
      }
    } catch (exception, stackTrace) {
      LogUtility.error(
        tag: 'SignUpBloc._onSignUpNicknamePicked',
        message: exception.toString(),
        stackTrace: stackTrace,
      );

      emit(
        state.copyWith(
          status: const SignUpNicknameFailedStatus(
            StateCode.unknownState,
            StateCode.unknown,
          )
        )
      );
    }
  }

  void _onSignUpSubmit(SignUpSubmit event, Emitter<SignUpState> emit) async {
    emit(
      state.copyWith(status: const SignUpLoadingStatus())
    );

    if (event.useApple) {
      emit(
        state.copyWith(
          status: SignUpFailed(
            StateCode.serviceUnavailable.name,
            StateCode.serviceUnavailable.index,
          )
        )
      );
      return;
    }

    final googleSignIn = GoogleSignIn(
      scopes: ['email', 'openid', 'profile'],
      serverClientId: apiServerClientId,
    );

    if (await googleSignIn.isSignedIn()) {
      googleSignIn.signOut().onError((exception, stackTrace) {
        LogUtility.error(
          tag: 'SignUpBloc._onSignUpSubmit',
          message: exception.toString(),
          stackTrace: stackTrace,
        );
        return;
      });

      googleSignIn.disconnect().onError((exception, stackTrace) {
        LogUtility.error(
          tag: 'SignUpBloc._onSignUpSubmit',
          message: exception.toString(),
          stackTrace: stackTrace,
        );
        return;
      });
    }

    try {
      final signInResult = await googleSignIn.signIn();
      final auth = await signInResult!.authentication;

      final response = await SignUpRepository.signUp(
        pinCode: state.pin,
        nickname: state.nickname,
        idToken: auth.idToken!,
        age: int.tryParse(state.age),
      );

      if (response.code != 0) {
        emit(
          state.copyWith(status: SignUpFailed(response.state, response.code))
        );
      } else {
        await AuthService.setAuth(
          authToken: response.data!.authToken,
          lastLogin: response.data!.user.lastSignedInAt,
          pinCode: state.pin,
        );

        emit(
          state.copyWith(
            status: SignUpSuccess(
              response.data!.user,
              response.data!.authToken,
            )
          )
        );
      }
    } catch (exception, stackTrace) {
      LogUtility.error(
        tag: 'SignUpBloc._onSignUpSubmit',
        message: exception.toString(),
        stackTrace: stackTrace,
      );

      emit(
        state.copyWith(
          status: const SignUpFailed(StateCode.unknownState, StateCode.unknown)
        )
      );
    }
  }
}
