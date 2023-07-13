import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helpme/core/widgets/scale_on_press.dart';
import 'package:helpme/signup/data/signup_bloc.dart';
import 'package:helpme/signup/data/signup_event.dart';
import 'package:helpme/signup/data/signup_state.dart';
import 'package:helpme/signup/data/signup_status.dart';

class SignUpFirstStageSubmitButton extends StatelessWidget {
  const SignUpFirstStageSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, mediaQuery.viewPadding.bottom + 16),
      child: Align(
        alignment: Alignment.bottomRight,
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) => AnimatedOpacity(
            opacity: state.isAgeValid && state.isNicknameValid ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: ScaleOnPress(
              onPressScale: 0.95,
              child: FilledButton(
                onPressed: () {
                  if (state.status is! SignUpNicknameLoadingStatus) {
                    context.read<SignUpBloc>().add(
                      SignUpNicknamePicked()
                    );
                  }
                },
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.status is SignUpNicknameLoadingStatus
                      ? const SizedBox(
                        key: ValueKey<int>(0),
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                      : Text(locale.continueButton, key: const ValueKey<int>(1)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
