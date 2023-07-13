import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helpme/signup/data/signup_bloc.dart';
import 'package:helpme/signup/data/signup_event.dart';
import 'package:helpme/signup/data/signup_state.dart';
import 'package:pinput/pinput.dart';

class SignUpSecondStagePinInput extends StatelessWidget {
  const SignUpSecondStagePinInput({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final locale = AppLocalizations.of(context)!;

    return Align(
      alignment: Alignment.center,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        curve: Curves.decelerate,
        padding: EdgeInsets.fromLTRB(16, 16, 16, mediaQuery.viewInsets.bottom / 2),
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 64,
                  textStyle: theme.textTheme.titleMedium!.copyWith(color: Colors.white),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onChanged: (value) {
                  context.read<SignUpBloc>().add(
                      SignUpPinChanged(value)
                  );
                },
                onCompleted: (_) {
                  context.read<SignUpBloc>().add(
                      SignUpReady()
                  );
                },
              ),
              const SizedBox(height: 24),
              AnimatedOpacity(
                opacity: state.status.isReady ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Text(
                  locale.pinWarning,
                  style: theme.textTheme.bodySmall!.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
