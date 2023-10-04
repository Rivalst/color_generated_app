import 'package:bloc/bloc.dart';
import 'package:color_g/data/local/load_language_from_shared_preferences.dart';

part 'language_state.dart';

/// This cubit for control language state in app
class LanguageCubit extends Cubit<LanguageState> {
  /// This constructor provide in super [LanguageState] for if [loadLanguage]
  /// will be doesn't work in app automatically english language
  LanguageCubit() : super(LanguageState(Language.english)) {
    loadLanguage();
  }

  /// Method for change state language
  void changeLanguage(Language newLanguage) {
    emit(LanguageState(newLanguage));
    LanguageSetManager().safeLanguage(newLanguage: newLanguage);
  }

  /// Method for load language which was be set in past
  Future<void> loadLanguage() async {
    final Future<String?> language = LanguageSetManager().loadSelectLanguage();
    final String? selectedLanguage = await language;
    if (selectedLanguage == Language.ukrainian.toString()) {
      emit(LanguageState(Language.ukrainian));
    } else {
      emit(LanguageState(Language.english));
    }
  }
}
