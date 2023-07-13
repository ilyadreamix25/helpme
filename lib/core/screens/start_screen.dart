import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helpme/navigation.dart';
import 'package:helpme/core/widgets/alert_dialog.dart';
import 'package:helpme/core/widgets/button_group.dart';
import 'package:helpme/core/widgets/scaffold.dart';
import 'package:helpme/core/widgets/scale_on_press.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with SingleTickerProviderStateMixin {
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
      appBarBackgroundColor: theme.colorScheme.primary,
      title: Text(locale.appName),
      actions: [_moreButton()],
      backgroundColor: theme.colorScheme.primary,
      keyboardSafe: true,
      body: Stack(
        children: [
          _doYouNeedHelpTitle(),
          _spinningCircle(),
          _buttons(),
        ],
      ),
    );
  }

  Widget _buttons() {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final locale = AppLocalizations.of(context)!;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: mediaQuery.viewPadding.bottom + 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              locale.itWontTakeLong,
              style: theme.textTheme.bodySmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.maxFinite,
              child: ScaleOnPress(
                onPressScale: 0.95,
                child: FilledButton(
                  onPressed: Platform.isAndroid
                    ? _startWithGoogleAccount
                    : _startWithAppleId,
                  child: Text(
                    Platform.isAndroid
                      ? locale.startWithGoogleAccount
                      : locale.startWithAppleId
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.maxFinite,
              child: ScaleOnPress(
                onPressScale: 0.95,
                child: OutlinedButton(
                  onPressed: Platform.isAndroid
                    ? _startWithAppleId
                    : _startWithGoogleAccount,
                  child: Text(
                    Platform.isAndroid
                      ? locale.startWithAppleId
                      : locale.startWithGoogleAccount,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _spinningCircle() {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Transform.translate(
        offset: Offset(0, mediaQuery.size.width / 2.75),
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
    );
  }

  Widget _doYouNeedHelpTitle() {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locale.doYouNeedHelp,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            locale.weWillHelp,
            style: theme.textTheme.bodyMedium,
          ),
        ],
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
        onSelected: _onMenuItemClicked,
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

  void _startWithGoogleAccount() {
    final locale = AppLocalizations.of(context)!;

    showHelpMeAlertDialog(
      context,
      HelpMeAlertDialog(
        title: Text(locale.areYouAlreadyWithUs),
        body: VerticalButtonGroup(
          items: [
            ButtonGroupItem(
              onPressed: () {
                Navigator.of(context).pushNamed(HelpMeNavigation.signInRoute, arguments: {
                  'useApple': false
                });
              },
              child: Text(locale.signIn),
            ),
            ButtonGroupItem(
              onPressed: () {
                Navigator.of(context).pushNamed(HelpMeNavigation.signUpRoute, arguments: {
                  'useApple': false
                });
              },
              child: Text(locale.signUp),
            ),
          ],
        ),
        onExitClicked: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _startWithAppleId() {
    final locale = AppLocalizations.of(context)!;

    showHelpMeAlertDialog(
      context,
      HelpMeAlertDialog(
        title: Text(locale.areYouAlreadyWithUs),
        body: VerticalButtonGroup(
          items: [
            ButtonGroupItem(
              onPressed: () {
                Navigator.of(context).pushNamed(HelpMeNavigation.signInRoute, arguments: {
                  'useApple': true
                });
              },
              child: Text(locale.signIn),
            ),
            ButtonGroupItem(
              onPressed: () {
                Navigator.of(context).pushNamed(HelpMeNavigation.signUpRoute, arguments: {
                  'useApple': true
                });
              },
              child: Text(locale.signUp),
            ),
          ],
        ),
        onExitClicked: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _onMenuItemClicked(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, HelpMeNavigation.aboutRoute);
        return;
    }
  }
}
