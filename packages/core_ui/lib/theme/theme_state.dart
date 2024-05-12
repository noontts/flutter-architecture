import 'package:core_ui/theme/color/theme_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

enum Theme{
  dark,
  light
}

@freezed
class ThemeState with _$ThemeState{
  factory ThemeState({
    required Theme selectedTheme,
    required IThemeColor themeColor
  }) = _ThemeState;
}