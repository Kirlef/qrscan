import 'package:flutter/material.dart';
import 'dart:math';

part 'app_colors/app_colors.dart';
part 'app_colors/app_colors_dark.dart';
part 'app_colors/app_colors_light.dart';
part 'app_text_styles/app_text_style.dart';
part 'app_text_styles/app_text_styles.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  AppTheme() : this.fromBrightness(Brightness.dark);

  AppTheme.fromBrightness(this.brightness) {
    if (brightness == Brightness.dark) {
      colors = AppColorsDark._();
    } else {
      colors = AppColorsLight._();
    }

    textStyles = AppTextStyles._(colors);
  }

  AppTheme._copy({
    required this.colors,
    required this.brightness,
    required this.textStyles,
  });

  late final AppColors colors;
  late final Brightness brightness;
  late final AppTextStyles textStyles;

  @override
  AppTheme copyWith() {
    return AppTheme._copy(
      colors: colors,
      brightness: brightness,
      textStyles: textStyles,
    );
  }

  @override
  AppTheme lerp(covariant AppTheme? other, double t) {
    if (other == null) return this;

    return AppTheme._copy(
      colors: other.colors,
      brightness: other.brightness,
      textStyles: other.textStyles,
    );
  }
}
