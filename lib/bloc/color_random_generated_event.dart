part of 'color_random_generated_bloc.dart';

/// Standard class for Event BLoC abstract class ColorRandomGeneratedEvent {}
@immutable
abstract class ColorRandomGeneratedEvent {}

/// This class used for pointed event on change All color
final class ColorRandomOnChangedAll extends ColorRandomGeneratedEvent {}

/// This class used for pointed event on change Light color
final class ColorRandomOnChangedLight extends ColorRandomGeneratedEvent {}

/// This class used for pointed event on change Dark color
final class ColorRandomOnChangedDark extends ColorRandomGeneratedEvent {}

/// This class used for pointed event that now need generated Light color
final class ColorRandomChangedStatusToLight extends ColorRandomGeneratedEvent {}

/// This class used for pointed event that now need generated Dark color
final class ColorRandomChangedStatusToDark extends ColorRandomGeneratedEvent {}

/// This class used for pointed event that now need generated All color
final class ColorRandomChangedStatusToAll extends ColorRandomGeneratedEvent {}
