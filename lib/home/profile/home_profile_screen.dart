import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helpme/core/widgets/scaffold.dart';

class HomeProfileScreen extends StatelessWidget {
  const HomeProfileScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;

    return HelpMeScaffold(
      appBarBackgroundColor: theme.colorScheme.primary,
      title: Text(locale.profile),
      backgroundColor: theme.colorScheme.primary,
      body: SizedBox.fromSize(size: Size.zero)
    );
  }
}
