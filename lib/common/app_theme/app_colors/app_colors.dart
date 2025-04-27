// ignore_for_file: prefer_final_fields

part of '../app_theme.dart';

abstract class AppColors {
  void setPrimaryDarkest(Color primaryDarkest) {
    _primaryDarkest = primaryDarkest;
  }

  // Primary:
  Color _primaryLightest = const Color.fromRGBO(255, 212, 166, 1);
  Color _primaryDefault = const Color.fromRGBO(255, 130, 0, 1);
  Color _primaryDarkest = const Color.fromRGBO(85, 41, 0, 1);

  Color get primaryLightest => _primaryLightest;
  Color get primaryDefault => _primaryDefault;
  Color get primaryDarkest => _primaryDarkest;

  // Success:
  Color _successLighter = const Color.fromRGBO(110, 211, 106, 1);
  Color _successDefault = const Color.fromRGBO(58, 170, 53, 1);

  Color get successLighter => _successLighter;
  Color get successDefault => _successDefault;

  // Danger:
  Color _dangerDefault = const Color.fromRGBO(255, 111, 102, 1);
  Color _dangerDarker = const Color.fromRGBO(173, 82, 78, 1);

  Color get dangerDefault => _dangerDefault;
  Color get dangerDarker => _dangerDarker;

  // Warning:
  Color _warningDefault = const Color.fromRGBO(255, 222, 0, 1);
  Color _warningDarkest = const Color.fromRGBO(245, 198, 30, 1);

  Color get warningDefault => _warningDefault;
  Color get warningDarkest => _warningDarkest;

  // Neutrals:
  Color _whiteNeutrals00 = const Color.fromRGBO(255, 255, 255, 1);
  Color _lightNeutrals30 = const Color.fromRGBO(229, 229, 229, 1);
  Color _greyerNeutrals40 = const Color.fromRGBO(187, 187, 187, 1);
  Color _greyerNeutrals50 = const Color.fromRGBO(102, 102, 102, 1);
  Color _darkNeutrals70 = const Color.fromRGBO(59, 59, 60, 1);
  Color _greyestNeutrals60 = const Color.fromRGBO(76, 76, 76, 1);
  Color _darkestNeutrals80 = const Color.fromRGBO(38, 38, 39, 1);
  Color _darkestNeutrals90 = const Color.fromRGBO(27, 31, 34, 1);
  Color _blackNeutrals100 = const Color.fromRGBO(0, 0, 0, 1);
  Color _neutralsOverlay = const Color.fromRGBO(0, 0, 0, 0.8);

  Color get whiteNeutrals00 => _whiteNeutrals00;
  Color get lightNeutrals30 => _lightNeutrals30;
  Color get greyerNeutrals50 => _greyerNeutrals50;
  Color get greyerNeutrals40 => _greyerNeutrals40;
  Color get darkNeutrals70 => _darkNeutrals70;
  Color get greyestNeutrals60 => _greyestNeutrals60;
  Color get darkestNeutrals80 => _darkestNeutrals80;
  Color get darkestNeutrals90 => _darkestNeutrals90;
  Color get blackNeutrals100 => _blackNeutrals100;
  Color get neutralsOverlay => _neutralsOverlay;

  // General:
  Color _transparent = const Color.fromRGBO(0, 0, 0, 0);

  Color get transparent => _transparent;

  // Text:
  Color _disabled = const Color.fromRGBO(255, 255, 255, 0.4);
  Color _mediumEmphasis = const Color.fromRGBO(255, 255, 255, 0.64);
  Color _highEmphasis = const Color.fromRGBO(255, 255, 255, 1);

  Color get disabled => _disabled;
  Color get mediumEmphasis => _mediumEmphasis;
  Color get highEmphasis => _highEmphasis;

  // Shadows:
  Color _dropShadow = const Color.fromRGBO(0, 0, 0, 0.25);
  Color _innerShadow = const Color.fromRGBO(255, 255, 255, 0.1);
  Color _glassSurface = const Color.fromRGBO(255, 255, 255, 0.15);

  Color get dropShadow => _dropShadow;
  Color get innerShadow => _innerShadow;
  Color get glassSurface => _glassSurface;

  // Separator:
  Color _darkSeparator = const Color.fromRGBO(0, 0, 0, 0.2);
  Color _lightSeparator = const Color.fromRGBO(255, 255, 255, 0.08);

  Color get darkSeparator => _darkSeparator;
  Color get lightSeparator => _lightSeparator;

  // Buttons:
  Color _textButton = const Color.fromRGBO(231, 118, 12, 1);
  Color _button = const Color.fromRGBO(255, 144, 40, 1);
  Color _favoriteYellow = const Color.fromRGBO(255, 209, 46, 1);

  Color get textButton => _textButton;
  Color get button => _button;
  Color get favoriteYellow => _favoriteYellow;

  // Icons:
  Color _iconsLightGray = const Color.fromRGBO(145, 147, 149, 1);

  Color get iconsLightGray => _iconsLightGray;

  // Skeleton:
  Color _skeletonElement = const Color.fromRGBO(45, 50, 54, 1);
  Color _skeletonBase = const Color.fromRGBO(200, 200, 200, 0.5);
  Color _skeletonHighlight = const Color.fromRGBO(163, 163, 163, 0.6);

  Color get skeletonElement => _skeletonElement;
  Color get skeletonBase => _skeletonBase;
  Color get skeletonHighlight => _skeletonHighlight;

  // Gradients:
  LinearGradient _toastGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.2),
      Color.fromRGBO(255, 255, 255, 0.15),
    ],
    stops: [0.5, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  LinearGradient _blockGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(42, 45, 50, 1),
      Color.fromRGBO(35, 38, 42, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  LinearGradient _glassGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(107, 109, 110, 1),
      Color.fromRGBO(107, 109, 110, 1),
      Color.fromRGBO(76, 78, 80, 1),
      Color.fromRGBO(107, 109, 110, 1),
      Color.fromRGBO(107, 109, 110, 1),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    transform: GradientRotation(90),
  );
  LinearGradient _buttonGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(251, 151, 47, 1),
      Color.fromRGBO(255, 130, 0, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  LinearGradient _informationGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(35, 38, 40, 1),
      Color.fromRGBO(31, 34, 35, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  LinearGradient _cardGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(255, 130, 0, 0.6),
      Color.fromRGBO(255, 130, 0, 0),
    ],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );
  LinearGradient _skeletonGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(255, 255, 255, 0.7),
      Color.fromRGBO(255, 255, 255, 0.7),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  RadialGradient _homeBackgroundGradient = const RadialGradient(
    colors: [
      Color.fromRGBO(255, 130, 0, 1),
      Color.fromRGBO(162, 56, 14, 1),
      Color.fromRGBO(1, 1, 1, 1),
      Color.fromRGBO(1, 1, 1, 1),
    ],
    stops: [0.1988, 0.5681, 0.8956, 1],
    center: Alignment(1, 1),
    radius: 1.2,
    transform: GradientRotation(276.31 * pi / 90),
  );

  LinearGradient get cardGradient => _cardGradient;
  LinearGradient get toastGradient => _toastGradient;
  LinearGradient get blockGradient => _blockGradient;
  LinearGradient get glassGradient => _glassGradient;
  LinearGradient get buttonGradient => _buttonGradient;
  LinearGradient get informationGradient => _informationGradient;
  LinearGradient get skeletonGradient => _skeletonGradient;
  RadialGradient get homeBackgroundGradient => _homeBackgroundGradient;
}
