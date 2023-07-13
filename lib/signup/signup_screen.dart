import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helpme/core/widgets/scaffold.dart';
import 'package:helpme/navigation.dart';
import 'package:helpme/signup/data/signup_bloc.dart';
import 'package:helpme/signup/signup_content.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final bool useApple;

  const SignUpScreen({super.key, this.useApple = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;

    return HelpMeScaffold(
      addNavigationButton: true,
      title: Text(locale.appName),
      appBarBackgroundColor: theme.colorScheme.primary,
      actions: [_moreButton(context)],
      backgroundColor: theme.colorScheme.primary,
      body: Provider.value(
        value: useApple,
        child: BlocProvider(
          create: (_) => SignUpBloc(),
          child: const SignUpContent(),
        ),
      ),
    );
  }
  
  Widget _moreButton(BuildContext context) {
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
        onSelected: (option) => _onMenuItemClicked(context, option),
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

  void _onMenuItemClicked(BuildContext context, int option) {
    switch (option) {
      case 0:
        Navigator.pushNamed(context, HelpMeNavigation.aboutRoute);
        return;
    }
  }
}
