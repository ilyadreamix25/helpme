import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helpme/core/widgets/alert_dialog.dart';
import 'package:helpme/signup/data/signup_bloc.dart';
import 'package:helpme/signup/data/signup_state.dart';
import 'package:helpme/signup/data/signup_status.dart';
import 'package:helpme/signup/ui/first_stage/first_stage_submit_button.dart';
import 'package:helpme/signup/ui/first_stage/first_stage_top_content.dart';
import 'package:helpme/signup/ui/signup_spinning_circle.dart';

class SignUpFirstStage extends StatelessWidget {
  const SignUpFirstStage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return BlocListener<SignUpBloc, SignUpState>(
      key: const ValueKey(0),
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status is SignUpNicknameNotAvailableStatus) {
          showOopsDialog(context, locale.nicknameUnavaliable);
        } else if (state.status is SignUpNicknameFailedStatus) {
          final apiState = state.status as SignUpNicknameFailedStatus;
          showApiErrorDialog(context, apiState.state, apiState.code);
        }
      },
      child: const Stack(
        children: [
          SignUpFirstStageTopContent(),
          SignUpSpinningCircle(),
          SignUpFirstStageSubmitButton(),
        ],
      ),
    );
  }
}
