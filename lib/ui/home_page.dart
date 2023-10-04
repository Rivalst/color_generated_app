import 'package:color_g/bloc/color_random_generated_bloc.dart';
import 'package:color_g/bloc/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';


/// It's a home page where u can see random color generation on tap
class HomePage extends StatefulWidget {
  /// Basic constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double fontSize17 = 17.0;
  final double fontSize32 = 32.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorRandomGeneratedBloc, ColorRandomGeneratedState>(
      builder: (contextRandom, state) {
        return Scaffold(
          body: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            color: state.backgroundColor,
            child: InkWell(
              onTap: () {
                if (state.status == StatusColor.ligth) {
                  context
                      .read<ColorRandomGeneratedBloc>()
                      .add(ColorRandomOnChangedLight());
                } else if (state.status == StatusColor.dark) {
                  context
                      .read<ColorRandomGeneratedBloc>()
                      .add(ColorRandomOnChangedDark());
                } else {
                  context
                      .read<ColorRandomGeneratedBloc>()
                      .add(ColorRandomOnChangedAll());
                }
              },
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.hello_there,
                  style: GoogleFonts.ubuntu(fontSize: fontSize17),
                ),
              ),
            ),
          ),
          floatingActionButton: IconButton(
            /// Open settings
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(children: [
                      TextButton(
                        /// Open language settings
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        /// Change language to en
                                        context
                                            .read<LanguageCubit>()
                                            .changeLanguage(Language.english);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                          AppLocalizations.of(context)!.en,),),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Divider(),
                                  ),
                                  TextButton(
                                    /// Change language to uk
                                    onPressed: () {
                                      context
                                          .read<LanguageCubit>()
                                          .changeLanguage(Language.ukrainian);
                                      Navigator.of(context).pop();
                                    },
                                    child:
                                        Text(AppLocalizations.of(context)!.uk),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.change_language,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          contextRandom
                              .read<ColorRandomGeneratedBloc>()
                              .add(ColorRandomChangedStatusToAll());
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.set_to_all),
                      ),
                      TextButton(
                        onPressed: () {
                          contextRandom
                              .read<ColorRandomGeneratedBloc>()
                              .add(ColorRandomChangedStatusToLight());
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.set_to_light),
                      ),
                      TextButton(
                        onPressed: () {
                          contextRandom
                              .read<ColorRandomGeneratedBloc>()
                              .add(ColorRandomChangedStatusToDark());
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.set_to_dark),
                      ),
                    ],);
                  },);
            },
            icon: Icon(Icons.settings, size: fontSize32),
          ),
        );
      },
    );
  }
}
