part of '../app_theme.dart';

class _AppTextStyle extends TextStyle {
  _AppTextStyle({
    required double height,
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
  }) : super(
          height: height,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: 'OpenSans',
          package: 'design_system',
          color: colors.highEmphasis,
        );

  static late AppColors colors;
}
