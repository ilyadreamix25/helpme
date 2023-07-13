import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/core/widgets/alert_dialog.dart';
import 'package:helpme/navigation.dart';
import 'package:helpme/signin/data/signin_bloc.dart';
import 'package:helpme/signin/data/signin_state.dart';
import 'package:helpme/signin/data/signin_status.dart';
import 'package:helpme/signin/ui/signin_pincode_input.dart';
import 'package:helpme/signin/ui/signin_spinning_circle.dart';
import 'package:helpme/signin/ui/signin_submit_button.dart';
import 'package:helpme/signin/ui/signin_text.dart';

class SignInContent extends StatelessWidget {
  const SignInContent({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status is SignInErrorStatus) {
          final apiState = state.status as SignInErrorStatus;
          showApiErrorDialog(context, apiState.state, apiState.code);
        } else if (state.status is SignInSuccessStatus) {
          Navigator.of(context).pushNamedAndRemoveUntil(HelpMeNavigation.homeRoute, (_) => false);
        }
      },
      child: const Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SignInText(),
          ),
          SignInSpinningCircle(),
          SignInPinCodeInput(),
          SignInSubmitButton(),
        ],
      ),
    );
  }
}
