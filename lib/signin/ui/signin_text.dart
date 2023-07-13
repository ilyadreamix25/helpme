import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInText extends StatelessWidget {
  const SignInText({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          locale.welcomeBack,
          style: theme.textTheme.titleMedium,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 8),
        Text(
          locale.callToMindPinCode,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
