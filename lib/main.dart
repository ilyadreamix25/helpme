import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:helpme/core/auth/auth_service.dart';
import 'package:helpme/navigation.dart';
import 'package:helpme/themes.dart';
import 'package:helpme/core/utils/sysui_util.dart';

void main() async {
  final appInitResult = await _appInit();
  final String initialRoute = appInitResult['initialRoute']!;

  runApp(HelpMeApp(initialRoute: initialRoute));
  FlutterNativeSplash.remove();
}

class HelpMeApp extends StatelessWidget {
  final String initialRoute;

  const HelpMeApp({required this.initialRoute, super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: helpMeTheme,
    themeMode: ThemeMode.light,
    title: 'HelpMe',
    initialRoute: initialRoute,
    onGenerateRoute: HelpMeNavigation.generateRoute,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
  );
}

Future<Map<String, dynamic>> _appInit() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  await applyEdgeToEdgeScreen();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  Map<String, dynamic> result = {};
  result['initialRoute'] = HelpMeNavigation.startRoute;

  final reloginResult = await AuthService.relogin();

  if (reloginResult) {
    result['initialRoute'] = HelpMeNavigation.homeRoute;
  }

  return result;
}
