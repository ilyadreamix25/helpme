import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helpme/core/widgets/scaffold.dart';
import 'package:helpme/navigation.dart';
import 'package:helpme/signin/data/signin_bloc.dart';
import 'package:helpme/signin/signin_content.dart';
import 'package:provider/provider.dart';

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
      body: Provider.value(
        value: widget.useApple,
        child: BlocProvider(
          create: (_) => SignInBloc(),
          child: const SignInContent(),
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
