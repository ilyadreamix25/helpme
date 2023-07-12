import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helpme/core/widgets/alert_dialog.dart';
import 'package:helpme/core/widgets/scaffold.dart';
import 'package:helpme/core/widgets/scale_on_press.dart';
import 'package:helpme/core/widgets/titled_textfield.dart';
import 'package:helpme/navigation.dart';
import 'package:helpme/signup/data/signup_bloc.dart';
import 'package:helpme/signup/data/signup_event.dart';
import 'package:helpme/signup/data/signup_state.dart';
import 'package:helpme/signup/data/signup_status.dart';
import 'package:pinput/pinput.dart';

class SignUpScreen extends StatefulWidget {
  final bool useApple;

  const SignUpScreen({super.key, this.useApple = false});

  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;

    return HelpMeScaffold(
      addNavigationButton: true,
      title: Text(locale.appName),
      appBarBackgroundColor: theme.colorScheme.primary,
      actions: [_moreButton()],
      backgroundColor: theme.colorScheme.primary,
      body: BlocProvider(
        create: (_) => SignUpBloc(),
        child: _viewSwitcher(),
      ),
    );
  }

  // #region Shared

  Widget _viewSwitcher() => SizedBox(
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
          ? _firstStage()
          : _secondStage(),
      ),
    ),
  );

  Widget _spinningCircle() {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return ClipRect(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Transform.translate(
          offset: Offset(mediaQuery.size.width / 2, mediaQuery.size.width / 2),
          child: Transform.scale(
            scale: 1.15,
            child: RotationTransition(
              turns: _animationController,
              child: SvgPicture.asset('assets/images/scalloped_circle.svg',
                width: mediaQuery.size.width,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.primaryContainer,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _moreButton() {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;

    return IconButton(
      onPressed: () {},
      icon: PopupMenuButton<int>(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        color: theme.colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16)
          )
        ),
        icon: Icon(Icons.menu_rounded, color: theme.colorScheme.onSurface),
        onSelected: _onMenuItenClicked,
        itemBuilder: (_) => [
          PopupMenuItem(
            value: 0,
            child: Row(
              children: [
                Icon(CupertinoIcons.info_circle_fill, color: theme.colorScheme.onSurface),
                const SizedBox(width: 8),
                Text(
                  locale.about,
                  style: theme.textTheme.bodySmall!.copyWith(color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onMenuItenClicked(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, HelpMeNavigation.aboutRoute);
        return;
    }
  }
  
  // #endregion
  
  // #region First Stage

  Widget _firstStage() {
    final locale = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);

    return BlocListener<SignUpBloc, SignUpState>(
      key: const ValueKey<int>(0),
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status is SignUpNicknameNotAvailableStatus) {
          showOopsDialog(context, locale.nicknameUnavaliable);
        } else if (state.status is SignUpNicknameFailedStatus) {
          final apiState = state.status as SignUpNicknameFailedStatus;
          showApiErrorDialog(context, apiState.state, apiState.code);
        }
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, mediaQuery.padding.bottom + 16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _firstStageTitle(),
                  const SizedBox(height: 8),
                  _firstStageText(),
                  const SizedBox(height: 32),
                  _firstStageNicknameInput(),
                  _firstStageAgeInput(),
                ],
              ),
            ),
          ),
          _spinningCircle(),
          _firstStageNextButton(),
        ],
      ),
    );
  }

  Widget _firstStageTitle() {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Text(
      locale.weHaveBeenWaiting,
      style: theme.textTheme.titleMedium,
      textAlign: TextAlign.start,
    );
  }

  Widget _firstStageText() {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Text(
      locale.provideSomeInfo,
      style: theme.textTheme.bodyMedium,
      textAlign: TextAlign.start,
    );
  }

  Widget _firstStageNicknameInput() {
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
      )
    );
  }

  Widget _firstStageAgeInput() {
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
      )
    );
  }

  Widget _firstStageNextButton() {
    final locale = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, mediaQuery.viewPadding.bottom + 16),
        child: Align(
          alignment: Alignment.bottomRight,
          child: AnimatedOpacity(
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

  // #endregion

  // #region Second Stage

  Widget _secondStage() => BlocListener<SignUpBloc, SignUpState>(
    key: const ValueKey<int>(1),
    listenWhen: (previous, current) => previous.status != current.status,
    listener: (context, state) {
      if (state.status is SignUpFailed) {
        final apiState = state.status as SignUpFailed;
        showApiErrorDialog(context, apiState.state, apiState.code == -1 ? null : apiState.code);
      } else if (state.status is SignUpSuccess) {
        Navigator.of(context).pushNamedAndRemoveUntil(HelpMeNavigation.homeRoute, (_) => false);
      }
    },
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _secondStageTitle(),
                const SizedBox(height: 8),
                _secondStageText(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
        _spinningCircle(),
        _secondStagePinInput(),
        _secondStageFinishButton(),
      ],
    ),
  );

  Widget _secondStageTitle() {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Text(
      locale.nowItsTimeForSafety,
      style: theme.textTheme.titleMedium,
      textAlign: TextAlign.start,
    );
  }

  Widget _secondStageText() {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Text(
      locale.comeUpWithPin,
      style: theme.textTheme.bodyMedium,
      textAlign: TextAlign.start,
    );
  }

  Widget _secondStagePinInput() {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final locale = AppLocalizations.of(context)!;

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) => Align(
        alignment: Alignment.center,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
          padding: EdgeInsets.fromLTRB(16, 16, 16, mediaQuery.viewInsets.bottom / 2),
          child: Column(
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
      )
    );
  }

  Widget _secondStageFinishButton() {
    final locale = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, mediaQuery.viewPadding.bottom + 16),
        child: Align(
          alignment: Alignment.bottomRight,
          child: AnimatedOpacity(
            opacity: state.status.isReady && state.isPinFinished ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: ScaleOnPress(
              onPressScale: 0.95,
              child: FilledButton(
                onPressed: () {
                  if (state.status is! SignUpLoadingStatus) {
                    context.read<SignUpBloc>().add(
                      SignUpSubmit(widget.useApple)
                    );
                  }
                },
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.status is SignUpLoadingStatus
                      ? const SizedBox(
                        key: ValueKey<int>(0),
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                      : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            widget.useApple
                              ? 'assets/images/apple_logo.svg'
                              : 'assets/images/google_logo.svg',
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(locale.finish),
                        ],
                      ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // #endregion
}
