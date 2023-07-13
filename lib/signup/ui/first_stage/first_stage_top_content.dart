import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helpme/core/widgets/titled_textfield.dart';
import 'package:helpme/signup/data/signup_bloc.dart';
import 'package:helpme/signup/data/signup_event.dart';
import 'package:helpme/signup/data/signup_state.dart';

class SignUpFirstStageTopContent extends StatelessWidget {
  const SignUpFirstStageTopContent({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, mediaQuery.padding.bottom + 16),
      child: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FirstStageTitle(),
            SizedBox(height: 8),
            _FirstStageText(),
            SizedBox(height: 32),
            _FirstStageNicknameInput(),
            _FirstStageAgeInput(),
          ],
        ),
      )
    );
  }
}

class _FirstStageTitle extends StatelessWidget {
  const _FirstStageTitle();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Text(
      locale.weHaveBeenWaiting,
      style: theme.textTheme.titleMedium,
      textAlign: TextAlign.start,
    );
  }
}

class _FirstStageText extends StatelessWidget {
  const _FirstStageText();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Text(
      locale.provideSomeInfo,
      style: theme.textTheme.bodyMedium,
      textAlign: TextAlign.start,
    );
  }
}

class _FirstStageNicknameInput extends StatelessWidget {
  const _FirstStageNicknameInput();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitledTextField(
            title: locale.nickname,
            hint: locale.requiredValue,
            actions: TextInputAction.next,
            onChanged: (value) {
              context.read<SignUpBloc>().add(
                SignUpNicknameChanged(value)
              );
            },
          ),
          SizedBox(
            width: double.maxFinite,
            child: AnimatedSize(
              alignment: Alignment.topLeft,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
              child: Align(
                alignment: Alignment.topLeft,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: state.isNicknameValid
                    ? const SizedBox(height: 16)
                    : Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        locale.nicknameRules,
                        style: theme.textTheme.bodySmall!.copyWith(color: Colors.black),
                      ),
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FirstStageAgeInput extends StatelessWidget {
  const _FirstStageAgeInput();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitledTextField(
            title: locale.age,
            hint: locale.optional,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            actions: TextInputAction.done,
            inputType: TextInputType.number,
            onChanged: (value) {
              context.read<SignUpBloc>().add(
                SignUpAgeChanged(value)
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.maxFinite,
              child: Align(
                alignment: Alignment.topLeft,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: state.isAgeValid
                    ? null
                    : Text(
                      locale.invalidValue,
                      style: theme.textTheme.bodySmall!.copyWith(color: Colors.black),
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
