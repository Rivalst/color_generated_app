import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'color_random_generated_event.dart';

part 'color_random_generated_state.dart';

/// This BLoC for control and generated random color for [HomePage] background
class ColorRandomGeneratedBloc
    extends Bloc<ColorRandomGeneratedEvent, ColorRandomGeneratedState> {
  /// Constructor for [ColorRandomGeneratedBloc] where in first view
  /// super initialization [ColorRandomGeneratedInitial] with white color.
  ///
  /// Also in constructor provide random generation color method like:
  /// All color random generation [_colorRandomChanged]
  /// Light color random generation [_colorRandomChangedLight]
  /// Dark color random generation [_colorRandomChangedDark]
  /// [_setStatusAll], [_setStatusLight], [_setStatusDark] for set status
  /// "Which color pallet need used"
  ColorRandomGeneratedBloc() : super(ColorRandomGeneratedInitial()) {
    on(_colorRandomChanged);
    on(_colorRandomChangedLight);
    on(_colorRandomChangedDark);
    on(_setStatusAll);
    on(_setStatusLight);
    on(_setStatusDark);
  }

  void _colorRandomChanged(
    ColorRandomOnChangedAll event,
    Emitter<ColorRandomGeneratedState> emit,
  ) {
    final Random random = Random();
    final int red = random.nextInt(256);
    final int green = random.nextInt(256);
    final int blue = random.nextInt(256);
    final int alpha = random.nextInt(256);
    final Color randomColor = Color.fromARGB(alpha, red, green, blue);
    emit(ColorRandomGeneratedInChange(
        backgroundColor: randomColor, status: StatusColor.all,),);
  }

  void _colorRandomChangedLight(
    ColorRandomOnChangedLight event,
    Emitter<ColorRandomGeneratedState> emit,
  ) {
    final Random random = Random();
    final int red = random.nextInt(56) + 200;
    final int green = random.nextInt(56) + 200;
    final int blue = random.nextInt(56) + 200;
    final int alpha = random.nextInt(256);
    final Color randomColor = Color.fromARGB(alpha, red, green, blue);
    emit(ColorRandomGeneratedInChange(
        backgroundColor: randomColor, status: StatusColor.ligth,),);
  }

  void _colorRandomChangedDark(
    ColorRandomOnChangedDark event,
    Emitter<ColorRandomGeneratedState> emit,
  ) {
    final Random random = Random();
    final int red = random.nextInt(101);
    final int green = random.nextInt(101);
    final int blue = random.nextInt(101);
    final int alpha = random.nextInt(256);
    final Color randomColor = Color.fromARGB(alpha, red, green, blue);
    emit(
      ColorRandomGeneratedInChange(
        backgroundColor: randomColor,
        status: StatusColor.dark,
      ),
    );
  }

  void _setStatusDark(
    ColorRandomChangedStatusToDark event,
    Emitter<ColorRandomGeneratedState> emit,
  ) {
    emit(
      ColorRandomGeneratedInChange.copyWith(
        state,
        status: StatusColor.dark,
      ),
    );
  }

  void _setStatusLight(
    ColorRandomChangedStatusToLight event,
    Emitter<ColorRandomGeneratedState> emit,
  ) {
    emit(
      ColorRandomGeneratedInChange.copyWith(
        state,
        status: StatusColor.ligth,
      ),
    );
  }

  void _setStatusAll(
    ColorRandomChangedStatusToAll event,
    Emitter<ColorRandomGeneratedState> emit,
  ) {
    emit(
      ColorRandomGeneratedInChange.copyWith(
        state,
        status: StatusColor.all,
      ),
    );
  }
}
