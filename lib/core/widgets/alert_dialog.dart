import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:helpme/core/utils/locale_util.dart';
import 'package:helpme/core/utils/string_util.dart';
import 'package:helpme/core/widgets/scale_on_press.dart';

class HelpMeAlertDialog extends StatelessWidget {
  final Widget title;
  final Widget body;
  final void Function() onExitClicked;
  final bool? addCloseIconContrast;

  const HelpMeAlertDialog({
    super.key,
    required this.title,
    required this.body,
    required this.onExitClicked,
    this.addCloseIconContrast,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = AppLocalizations.of(context)!;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultTextStyle(
              style: theme.textTheme.bodySmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              child: title,
            ),
            const SizedBox(height: 16),
            body,
            const SizedBox(height: 20),
            ScaleOnPress(
              onPressScale: 0.75,
              onClick: (addCloseIconContrast != null && addCloseIconContrast!) ? null : onExitClicked,
              child: (addCloseIconContrast != null && addCloseIconContrast!)
                ? FilledButton(
                  onPressed: onExitClicked,
                  style: FilledButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 18,
                      vertical: 6
                    ),
                  ),
                  child: Text(
                    locale.close,
                    style: theme.textTheme.bodySmall!.copyWith(color: Colors.white),
                  ),
                )
                : Text(
                  locale.close,
                  style: theme.textTheme.bodySmall!.copyWith(color: Colors.black),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

void showHelpMeAlertDialog(
  BuildContext context,
  HelpMeAlertDialog dialog,
) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => Container(),
    transitionBuilder: (context, animation, secondaryAnimation, child) => Transform.scale(
      scale: Curves.easeInOut.transform(animation.value),
      child: Opacity(
        opacity: animation.value,
        child: dialog,
      ),
    ),
    transitionDuration: const Duration(milliseconds: 200),
  );
}

void showOopsDialog(
  BuildContext context,
  String content,
  [int? code]
) {
  final locale = AppLocalizations.of(context)!;
  final theme = Theme.of(context);

  showHelpMeAlertDialog(
    context,
    HelpMeAlertDialog(
      title: Text(code != null ? '${locale.oops} ($code)' : locale.oops),
      body: Text(
        content,
        style: theme.textTheme.bodySmall!.copyWith(
          color: Colors.black
        ),
        textAlign: TextAlign.center,
      ),
      addCloseIconContrast: true,
      onExitClicked: () {
        Navigator.of(context).pop();
      }
    )
  );
}

void showApiErrorDialog(
  BuildContext context,
  String state,
  [int? code]
) {
  final locale = AppLocalizations.of(context)!;
  loadLocaleAsDictionary(locale.localeName).then((dictLocale) {
    showOopsDialog(
      context,
      dictLocale['state${state.capitalized()}'],
      code,
    );
  });
}
