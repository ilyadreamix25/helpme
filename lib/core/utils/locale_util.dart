import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, dynamic>> loadLocaleAsDictionary(String locale) async {
  final String jsonString = await rootBundle.loadString('assets/l10n/app_$locale.arb');
  final Map<String, dynamic> jsonMap = json.decode(jsonString);

  return jsonMap.map((key, value) => MapEntry(key, value.toString()));
}
