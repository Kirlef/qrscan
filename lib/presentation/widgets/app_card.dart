import 'package:flutter/material.dart';
import 'package:qrscan/helper/extensions.dart';
import 'package:qrscan/presentation/widgets/app_button.dart';
import 'package:qrscan/presentation/widgets/gradient_box_border.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    this.borderRadius = 8,
    required this.child,
    this.button,
    this.backgroundColor,
    this.childPadding = const EdgeInsets.all(20),
    this.backgroundGradient,
    this.borderType = AppCardBorderType.innerShadow,
  });

  final double borderRadius;
  final Widget child;
  final AppButton? button;
  final Color? backgroundColor;
  final EdgeInsets childPadding;
  final Gradient? backgroundGradient;
  final AppCardBorderType borderType;

  static Widget divider(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1,
          width: double.maxFinite,
          child: ColoredBox(color: context.colors.darkSeparator),
        ),
        SizedBox(
          height: 1,
          width: double.maxFinite,
          child: ColoredBox(color: context.colors.lightSeparator),
        ),
      ],
    );
  }

  BoxBorder? getBorder(BuildContext context) {
    switch (borderType) {
      case AppCardBorderType.solid:
        return Border.all(
          color: context.colors.greyestNeutrals60,
          width: 2,
        );
      case AppCardBorderType.glassSurface:
        return Border(
          top: BorderSide(
            color: context.colors.glassSurface,
            width: 1,
          ),
        );
      case AppCardBorderType.none:
      case AppCardBorderType.innerShadow:
        return null;
      case AppCardBorderType.gradient:
        return GradientBoxBorder(
          gradient: context.colors.cardGradient,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient: backgroundGradient,
        border: getBorder(context),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        children: [
          Padding(
            padding: childPadding,
            child: child,
          ),
          if (button != null) AppCard.divider(context),
          if (button != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: button,
            ),
        ],
      ),
    );
  }
}

enum AppCardBorderType {
  none,
  solid,
  innerShadow,
  gradient,
  glassSurface;
}
