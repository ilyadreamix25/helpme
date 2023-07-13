import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/core/api/api_state.dart';
import 'package:helpme/core/widgets/alert_dialog.dart';
import 'package:helpme/navigation.dart';
import 'package:helpme/signup/data/signup_bloc.dart';
import 'package:helpme/signup/data/signup_state.dart';
import 'package:helpme/signup/data/signup_status.dart';
import 'package:helpme/signup/ui/second_stage/second_stage_finish_button.dart';
import 'package:helpme/signup/ui/second_stage/second_stage_pin_input.dart';
import 'package:helpme/signup/ui/second_stage/second_stage_top_content.dart';
import 'package:helpme/signup/ui/signup_spinning_circle.dart';

class SignUpSecondStage extends StatelessWidget {
  const SignUpSecondStage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      key: const ValueKey(1),
      listenWhen:(previous, current) => previous.status != current.status,
      listener:(context, state) {
        if (state.status is SignUpFailed) {
          final apiState = state.status as SignUpFailed;
          showApiErrorDialog(context,
            apiState.state,
            apiState.code == StateCode.unknown ? null : apiState.code);
        } else if (state.status is SignUpSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(HelpMeNavigation.homeRoute, (_) => false);
        }
      },
      child: const Stack(
        children: [
          SignUpSecondStageTopContent(),
          SignUpSpinningCircle(),
          SignUpSecondStagePinInput(),
          SignUpSecondStageFinishButton()
        ],
      ),
    );
  }
}
