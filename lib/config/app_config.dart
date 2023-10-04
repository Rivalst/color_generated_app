import 'package:color_g/bloc/color_random_generated_bloc.dart';
import 'package:color_g/bloc/language_cubit.dart';
import 'package:color_g/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// This class for config [MaterialApp] and provided BLoC in widget tree.
/// Also implement language set.
class AppConfig extends StatelessWidget {
  /// Basic constructor
  const AppConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(
                state.selectedLanguage == Language.ukrainian ? 'uk' : 'en',),
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: BlocProvider(
                create: (context) => ColorRandomGeneratedBloc(),
                child: const HomePage(),),
          );
        },
      ),
    );
  }
}
