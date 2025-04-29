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
}
