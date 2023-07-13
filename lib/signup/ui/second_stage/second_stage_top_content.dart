import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpSecondStageTopContent extends StatelessWidget {
  const SignUpSecondStageTopContent({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SecondStageTitle(),
            SizedBox(height: 8),
            _SecondStageText(),
          ],
        ),
      ),
    );
  }
}

class _SecondStageTitle extends StatelessWidget {
  const _SecondStageTitle();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Text(
      locale.nowItsTimeForSafety,
      style: theme.textTheme.titleMedium,
      textAlign: TextAlign.start,
    );
  }
}

class _SecondStageText extends StatelessWidget {
  const _SecondStageText();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Text(
      locale.comeUpWithPin,
      style: theme.textTheme.bodyMedium,
      textAlign: TextAlign.start,
    );
  }
}
