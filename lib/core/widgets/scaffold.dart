import 'package:flutter/material.dart';
import 'package:helpme/core/widgets/scale_on_press.dart';

class HelpMeScaffold extends StatelessWidget {
  final Widget body;
  final Widget? title;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final bool? addNavigationButton;
  final bool? extendBodyBehindAppBar;
  final Color? appBarBackgroundColor;
  final Color? backgroundColor;
  final bool? keyboardSafe;

  const HelpMeScaffold({
    super.key,
    required this.body,
    this.title,
    this.bottom,
    this.actions,
    this.addNavigationButton,
    this.extendBodyBehindAppBar,
    this.appBarBackgroundColor,
    this.backgroundColor,
    this.keyboardSafe,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final clickableActions = actions?.map((action) => 
      ScaleOnPress(
        onPressScale: 0.75,
        child: action,
      )
    );

    return Scaffold(
      appBar: AppBar(
        title: title != null
          ? DefaultTextStyle(
            style: theme.textTheme.titleSmall!,
            child: title!,
          )
          : null,
        leading: addNavigationButton ?? false
          ? ScaleOnPress(
            onPressScale: 0.75,
            child: IconButton(
              onPressed: () => _onBackButtonPressed(context),
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              )
            ),
          )
          : null,
        actions: clickableActions?.toList() ?? [],
        backgroundColor: appBarBackgroundColor ?? theme.colorScheme.surface,
        titleSpacing: addNavigationButton ?? false ? 0 : null,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: bottom,
      backgroundColor: backgroundColor ?? theme.colorScheme.surface,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      body: body,
      resizeToAvoidBottomInset: !(keyboardSafe ?? true),
    );
  }

  void _onBackButtonPressed(BuildContext context) async {
    FocusScope.of(context).unfocus();
    if (MediaQuery.of(context).viewInsets.bottom > 0) {
      Future
        .delayed(const Duration(milliseconds: 250))
        .then((_) => Navigator.pop(context));
    } else {
      Navigator.pop(context);
    }
  }
}
