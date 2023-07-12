import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helpme/core/widgets/alert_dialog.dart';
import 'package:helpme/core/widgets/scaffold.dart';
import 'package:helpme/core/widgets/scale_on_press.dart';
import 'package:helpme/navigation.dart';
import 'package:helpme/signin/data/signin_bloc.dart';
import 'package:helpme/signin/data/signin_event.dart';
import 'package:helpme/signin/data/signin_state.dart';
import 'package:helpme/signin/data/signin_status.dart';
import 'package:pinput/pinput.dart';

class SignInScreen extends StatefulWidget {
  final bool useApple;

  const SignInScreen({super.key, this.useApple = false});

  @override
  State<StatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with SingleTickerProviderStateMixin {
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
        create: (_) => SignInBloc(),
        child: _content(),
      ),
    );
  }

  // #region Main Content

  Widget _content() =>
    BlocListener<SignInBloc, SignInState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status is SignInErrorStatus) {
          final apiState = state.status as SignInErrorStatus;
          showApiErrorDialog(context, apiState.state, apiState.code);
        } else if (state.status is SignInSuccessStatus) {
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
                  _title(),
                  const SizedBox(height: 8),
                  _text(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          _spinningCircle(),
          _pinCodeInput(),
          _submitButton(),
        ],
      ),
    );

  Widget _title() {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Text(
      locale.welcomeBack,
      style: theme.textTheme.titleMedium,
      textAlign: TextAlign.start,
    );
  }

  Widget _text() {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Text(
      locale.callToMindPinCode,
      style: theme.textTheme.bodyMedium,
      textAlign: TextAlign.start,
    );
  }

  Widget _pinCodeInput() {
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

  Widget _submitButton() {
    final locale = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, mediaQuery.viewPadding.bottom + 16),
        child: Align(
          alignment: Alignment.bottomRight,
          child: AnimatedOpacity(
            opacity: !state.status.buttonHidden && state.isPinCodeFinished
              ? 1.0
              : 0.0,
            duration: const Duration(milliseconds: 200),
            child: ScaleOnPress(
              onPressScale: 0.95,
              child: FilledButton(
                onPressed: () {
                  if (state.status is! SignInLoadingStatus) {
                    context.read<SignInBloc>().add(
                      SignInSubmit(widget.useApple)
                    );
                  }
                },
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.status is SignInLoadingStatus
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

  // #region Etc

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
}
