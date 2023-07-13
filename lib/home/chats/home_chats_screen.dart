import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helpme/core/widgets/scaffold.dart';
import 'package:helpme/home/chats/home_chats_content.dart';

class HomeChatsScreen extends StatelessWidget {
  const HomeChatsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;

    return HelpMeScaffold(
      appBarBackgroundColor: theme.colorScheme.primary,
      title: Text(locale.chats),
      backgroundColor: theme.colorScheme.primary,
      body: const HomeChatsContent(),
    );
  }
}
