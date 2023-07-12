import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpme/core/utils/log_util.dart';

Future<void> applyEdgeToEdgeScreen() async {
  var sysBarIconBrightness = PlatformDispatcher.instance.platformBrightness == Brightness.light
    ? Brightness.dark
    : Brightness.light;

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: sysBarIconBrightness,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: sysBarIconBrightness,
    systemNavigationBarContrastEnforced: false,
  ));
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  LogUtility.info(tag: 'applyEdgeToEdgeScreen', message: 'Applied');
}
