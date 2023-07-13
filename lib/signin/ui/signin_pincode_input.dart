import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/signin/data/signin_bloc.dart';
import 'package:helpme/signin/data/signin_event.dart';
import 'package:helpme/signin/data/signin_state.dart';
import 'package:pinput/pinput.dart';

class SignInPinCodeInput extends StatelessWidget {
  const SignInPinCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) => Align(
        alignment: Alignment.center,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
          padding: EdgeInsets.fromLTRB(16, 16, 16, mediaQuery.viewInsets.bottom / 2),
          child: Pinput(
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
              context.read<SignInBloc>().add(
                SignInPinCodeChanged(value)
              );
            },
            onCompleted: (_) { 
              context.read<SignInBloc>().add(
                const SignInReady()
              );
            },
          ),
        ),
      ),
    );
  }
}
