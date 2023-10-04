import 'package:shared_preferences/shared_preferences.dart';

/// class is an abstract class that outlines the methods for loading and saving
/// language preferences from/to shared preferences.
abstract class LoadLanguageFromSharedPreferences {
  /// Method for safe language in shared preferences
  Future<void> safeLanguage({required newLanguage});
  /// Method for load language from shared preferences
  Future<String?> loadSelectLanguage();
}

/// This class for safe and load last selected language in app.
class LanguageSetManager extends LoadLanguageFromSharedPreferences {
  @override
  Future<void> safeLanguage({required newLanguage}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', newLanguage.toString());
  }

  @override
  Future<String?> loadSelectLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? selectedLanguage = prefs.getString('selectedLanguage');

    return selectedLanguage;
  }
}
