import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helpme/signup/data/signup_bloc.dart';
import 'package:helpme/signup/data/signup_state.dart';
import 'package:helpme/signup/ui/first_stage/first_stage.dart';
import 'package:helpme/signup/ui/second_stage/second_stage.dart';

class SignUpContent extends StatelessWidget {
  const SignUpContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (_, state) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) => SlideTransition(
            position:
              Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              )
              .animate(animation),
            child: child,
          ),
          child: state.status.isFirstStage
            ? const SignUpFirstStage()
            : const SignUpSecondStage(),
        ),
      ),
    );
  }
}
