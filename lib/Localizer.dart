import 'package:flutter/cupertino.dart';

enum LangCode { EN, DE, ES, FR, ID, IT, JA }

//static const COINECTOR_SUPPORTS_MANY_LANGUAGES =
// "🇪🇸 🇩🇪 🇫🇷 🇮🇹 🇬🇧 🇯🇵 🇮🇩";

class Localizer {
  static LangCode getLocale(ctx) {
    Locale myLocale = Localizations.localeOf(ctx);
    final String countryCode = myLocale.toString();
    LangCode langCode = LangCode.values.firstWhere(
        (e) => e.toString() == 'LangCode.' + countryCode.toUpperCase());
    return langCode;
  }
}
