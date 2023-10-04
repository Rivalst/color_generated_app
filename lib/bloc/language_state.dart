part of 'language_cubit.dart';

/// Basic state for [LanguageCubit]
class LanguageState {
  /// variable for check which language used
  final Language selectedLanguage;

  /// Basic constructor
  LanguageState(this.selectedLanguage);
}
/// enum for select which language need
enum Language { english, ukrainian }
