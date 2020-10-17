import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class Translator {
  static String translate(BuildContext ctx, String key) {
    try {
      return FlutterI18n.translate(ctx, key);
    } catch (e) {
      debugPrint("Translator missing key: " + key);
      return "---";
    }
  }
}