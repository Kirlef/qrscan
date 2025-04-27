part of '../app_theme.dart';

class AppTextStyles {
  AppTextStyles._(AppColors colors) {
    _AppTextStyle.colors = colors;

    // NavBar:
    _navBar = _AppTextStyle(
      height: 12 / 10,
      fontSize: 10,
      fontWeight: FontWeight.w400,
    );

    // Heading:
    _heading1 = _AppTextStyle(
      height: 40 / 32,
      fontSize: 32,
      fontWeight: FontWeight.w600,
    );
    _heading2 = _AppTextStyle(
      height: 32 / 24,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
    _heading3 = _AppTextStyle(
      height: 32 / 24,
      fontSize: 24,
    );
    _heading4 = _AppTextStyle(
      height: 24 / 16,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
    _heading5 = _AppTextStyle(
      height: 24 / 16,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    // Caption:
    _caption1 = _AppTextStyle(
      height: 16 / 14,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
    _caption2 = _AppTextStyle(
      height: 16 / 14,
      fontSize: 14,
    );
    _caption3 = _AppTextStyle(
      height: 16 / 13,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    );

    // Body:
    _body1 = _AppTextStyle(
      height: 24 / 16,
      fontSize: 16,
    );
    _body2 = _AppTextStyle(
      height: 20 / 14,
      fontSize: 14,
    );
    _body3 = _AppTextStyle(
      height: 16 / 13,
      fontSize: 13,
    );

    // Overline:
    _overline1 = _AppTextStyle(
      height: 16 / 12,
      fontSize: 12,
    );
    _overline2 = _AppTextStyle(
      height: 12 / 11,
      fontSize: 11,
    );

    // Buttons:
    _buttons1 = _AppTextStyle(
      height: 24 / 16,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    _buttons2 = _AppTextStyle(
      height: 24 / 14,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
    _buttons3 = _AppTextStyle(
      height: 16 / 13,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    );

    // Digits:
    _digits1 = _AppTextStyle(
      height: 40 / 32,
      fontSize: 32,
    );
    _digits2 = _AppTextStyle(
      height: 32 / 24,
      fontSize: 24,
    );
    _digits3 = _AppTextStyle(
      height: 24 / 20,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
    _digits4 = _AppTextStyle(
      height: 24 / 18,
      fontSize: 18,
    );
    _digits5 = _AppTextStyle(
      height: 16 / 16,
      fontSize: 16,
    );
    _digits6 = _AppTextStyle(
      height: 16 / 14,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );

    // Cents:
    _cents1 = _AppTextStyle(
      height: 40 / 16,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    _cents2 = _AppTextStyle(
      height: 32 / 24,
      fontSize: 24,
      fontWeight: FontWeight.w400,
    );
    _cents3 = _AppTextStyle(
      height: 24 / 20,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
    _cents5 = _AppTextStyle(
      height: 16 / 16,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    _cents6 = _AppTextStyle(
      height: 16 / 14,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  //NavBar
  late TextStyle _navBar;

  TextStyle get navBar => _navBar;

  // Heading:
  late TextStyle _heading1;
  late TextStyle _heading2;
  late TextStyle _heading3;
  late TextStyle _heading4;
  late TextStyle _heading5;

  TextStyle get heading1 => _heading1;
  TextStyle get heading2 => _heading2;
  TextStyle get heading3 => _heading3;
  TextStyle get heading4 => _heading4;
  TextStyle get heading5 => _heading5;

  // Caption:
  late TextStyle _caption1;
  late TextStyle _caption2;
  late TextStyle _caption3;

  TextStyle get caption1 => _caption1;
  TextStyle get caption2 => _caption2;
  TextStyle get caption3 => _caption3;

  // Body:
  late TextStyle _body1;
  late TextStyle _body2;
  late TextStyle _body3;

  TextStyle get body1 => _body1;
  TextStyle get body2 => _body2;
  TextStyle get body3 => _body3;

  // Overline:
  late TextStyle _overline1;
  late TextStyle _overline2;

  TextStyle get overline1 => _overline1;
  TextStyle get overline2 => _overline2;

  // Buttons:
  late TextStyle _buttons1;
  late TextStyle _buttons2;
  late TextStyle _buttons3;

  TextStyle get buttons1 => _buttons1;
  TextStyle get buttons2 => _buttons2;
  TextStyle get buttons3 => _buttons3;

  // Digits:
  late TextStyle _digits1;
  late TextStyle _digits2;
  late TextStyle _digits3;
  late TextStyle _digits4;
  late TextStyle _digits5;
  late TextStyle _digits6;

  TextStyle get digits1 => _digits1;
  TextStyle get digits2 => _digits2;
  TextStyle get digits3 => _digits3;
  TextStyle get digits4 => _digits4;
  TextStyle get digits5 => _digits5;
  TextStyle get digits6 => _digits6;

  // Cents:
  late TextStyle _cents1;
  late TextStyle _cents2;
  late TextStyle _cents3;
  late TextStyle _cents5;
  late TextStyle _cents6;

  TextStyle get cents1 => _cents1;
  TextStyle get cents2 => _cents2;
  TextStyle get cents3 => _cents3;
  TextStyle get cents5 => _cents5;
  TextStyle get cents6 => _cents6;
}
