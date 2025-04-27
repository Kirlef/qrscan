import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGs {
  SVGs._();

  static Widget get({
    required String svg,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      svg,
      width: width,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      fit: fit,
    );
  }

  static const String back = 'packages/design_system/assets/svgs/back.svg';
  static const String info = 'packages/design_system/assets/svgs/info.svg';
  static const String edit = 'packages/design_system/assets/svgs/edit.svg';
  static const String close = 'packages/design_system/assets/svgs/close.svg';
  static const String smile = 'packages/design_system/assets/svgs/smile.svg';
  static const String image = 'packages/design_system/assets/svgs/image.svg';
  static const String camera = 'packages/design_system/assets/svgs/camera.svg';
  static const String warning =
      'packages/design_system/assets/svgs/warning.svg';
  static const String success =
      'packages/design_system/assets/svgs/success.svg';
  static const String eyeOpen =
      'packages/design_system/assets/svgs/eye-open.svg';
  static const String loadSolid =
      'packages/design_system/assets/svgs/loan-solid.svg';
  static const String eyeClosed =
      'packages/design_system/assets/svgs/eye-closed.svg';
  static const String arrowDown =
      'packages/design_system/assets/svgs/arrow-down.svg';
  static const String bineo =
      'packages/design_system/assets/svgs/bineo-icon.svg';
  static const String searchIcon =
      'packages/design_system/assets/svgs/search-icon.svg';
  static const String information =
      'packages/design_system/assets/svgs/information.svg';
  static const String flipCamera =
      'packages/design_system/assets/svgs/flip_camera.svg';
  static const String filtersIcon =
      'packages/design_system/assets/svgs/filters-icon.svg';
  static const String pocketsSolid =
      'packages/design_system/assets/svgs/pockets-solid.svg';
  static const String accountSolid =
      'packages/design_system/assets/svgs/account-solid.svg';
  static const String gradientClock =
      'packages/design_system/assets/svgs/gradient-clock.svg';
  static const String gradientWarning =
      'packages/design_system/assets/svgs/gradient-warning.svg';
  static const String investmentsSolid =
      'packages/design_system/assets/svgs/investments-solid.svg';
  static const String creditCardSolid =
      'packages/design_system/assets/svgs/credit-card-solid.svg';
  static const String notificationsIcon =
      'packages/design_system/assets/svgs/notifications-icon.svg';
  static const String squareGradientWarning =
      'packages/design_system/assets/svgs/square-gradient-warning.svg';
  static const String bineoNotifications =
      'packages/design_system/assets/svgs/bineo-icon-notifications.svg';
  static const String notificationsActiveIcon =
      'packages/design_system/assets/svgs/notifications-active-icon.svg';
  static const String checkmark =
      'packages/design_system/assets/svgs/checkmark.svg';
  static const String showMore =
      'packages/design_system/assets/svgs/show-more.svg';
  static const String copy = 'packages/design_system/assets/svgs/copy.svg';
  static const String agenda = 'packages/design_system/assets/svgs/agenda.svg';
  static const String seguros =
      'packages/design_system/assets/svgs/seguros.svg';
  static const String capsules =
      'packages/design_system/assets/svgs/capsules.svg';
}
