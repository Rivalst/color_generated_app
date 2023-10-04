part of 'color_random_generated_bloc.dart';

/// Standard abstract class for Statement BLoC
@immutable
abstract class ColorRandomGeneratedState {
  /// variable for statement
  abstract final Color backgroundColor;

  /// variable for statement
  abstract final StatusColor status;
}

/// This enum for set status color in [ColorRandomGeneratedState]
enum StatusColor { all, ligth, dark }

/// This class used for initial backgroundColor when BLoC was first created.
class ColorRandomGeneratedInitial extends ColorRandomGeneratedState {
  @override
  final StatusColor status = StatusColor.all;

  @override
  final Color backgroundColor = Colors.white;
}

/// This class used when color in state is changed
class ColorRandomGeneratedInChange extends ColorRandomGeneratedState {
  @override
  final Color backgroundColor;

  @override
  final StatusColor status;

  /// Constructor for set color
  ColorRandomGeneratedInChange({
    required this.backgroundColor,
    required this.status,
  });

  /// This factory for change status in State
  factory ColorRandomGeneratedInChange.copyWith(
    ColorRandomGeneratedState original, {
    Color? backgroundColor,
    StatusColor? status,
  }) {
    return ColorRandomGeneratedInChange(
      backgroundColor: backgroundColor ?? original.backgroundColor,
      status: status ?? original.status,
    );
  }
}
