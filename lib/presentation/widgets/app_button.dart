
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:qrscan/helper/assets/svgs.dart';
import 'package:qrscan/helper/extensions.dart';
import 'package:qrscan/presentation/widgets/app_activity_indicator.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.isEnabled = true,
    this.isLoading = false,
    this.expandWidth = true,
    required this.title,
    this.tintColor,
    this.svgIcon,
    this.icon,
    this.iconColor,
    this.type = AppButtonType.primary,
    this.textStyle = AppButtonTextStyle.buttons1,
    this.onTap,
    this.padding,
    this.borderRadius,
  });

  final bool isEnabled;
  final bool isLoading;
  final bool expandWidth;
  final String title;
  final Color? tintColor;
  final String? svgIcon;
  final IconData? icon;
  final Color? iconColor;
  final AppButtonType type;
  final AppButtonTextStyle textStyle;
  final void Function()? onTap;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? borderRadius;

  AppButton copyWith({
    Key? key,
    bool? isEnabled,
    bool? isLoading,
    bool? expandWidth,
    String? title,
    Color? tintColor,
    String? svgIcon,
    IconData? icon,
    Color? iconColor,
    AppButtonType? type,
    AppButtonTextStyle? textStyle,
    void Function()? onTap,
    EdgeInsets? padding,
    BorderRadiusGeometry? borderRadius,
  }) {
    return AppButton(
      isEnabled: isEnabled ?? this.isEnabled,
      isLoading: isLoading ?? this.isLoading,
      expandWidth: expandWidth ?? this.expandWidth,
      title: title ?? this.title,
      tintColor: tintColor ?? this.tintColor,
      svgIcon: svgIcon ?? this.svgIcon,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      type: type ?? this.type,
      textStyle: textStyle ?? this.textStyle,
      onTap: onTap ?? this.onTap,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  double minWidth = 0;
  bool isTapped = false;
  GlobalKey key = GlobalKey();
  late bool isSmallButton = widget.type == AppButtonType.smallButton ||
      widget.type == AppButtonType.smallButtonPrimary;

  @override
  void initState() {
    super.initState();

    if (!widget.expandWidth && !isSmallButton) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => minWidth = key.currentContext!.size!.width);
      });
    }
  }

  void onStartTap() {
    setState(() => isTapped = true);
  }

  void onEndTap() {
    setState(() => isTapped = false);
  }

  Color getColor() {
    if (!widget.isEnabled || widget.isLoading) {
      return context.colors.greyestNeutrals60;
    }

    if (isTapped) {
      return context.colors.primaryLightest;
    }

    return context.colors.primaryDefault;
  }

  Color getTextColor() {
    if (widget.tintColor != null) {
      return widget.tintColor!;
    }

    if (widget.type == AppButtonType.primary ||
        widget.type == AppButtonType.smallButtonPrimary) {
      if (!widget.isEnabled || widget.isLoading) {
        return context.colors.blackNeutrals100;
      }

      return context.colors.primaryDarkest;
    }

    return getColor();
  }

  BoxDecoration getButtonDecoration() {
    switch (widget.type) {
      case AppButtonType.primary:
        bool showGradient = widget.isEnabled && !widget.isLoading && !isTapped;

        return BoxDecoration(
          color: showGradient ? null : getColor(),
          gradient: showGradient ? context.colors.buttonGradient : null,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: context.colors.dropShadow,
              blurRadius: 16,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: context.colors.innerShadow,
              blurRadius: 2,
              spreadRadius: 1,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0, 1),
              inset: true,
            ),
          ],
        );
      case AppButtonType.secondary:
        return BoxDecoration(
          color: context.colors.transparent,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
          border: Border.all(
            color: getColor(),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: context.colors.dropShadow,
              blurRadius: 16,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0, 4),
            ),
          ],
        );
      case AppButtonType.borderless:
        return BoxDecoration(
          color: context.colors.transparent,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        );
      case AppButtonType.smallButton:
        return BoxDecoration(
          color: context.colors.darkestNeutrals80,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(32),
          gradient: context.colors.blockGradient,
          boxShadow: [
            BoxShadow(
              color: context.colors.dropShadow,
              blurRadius: 16,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: context.colors.innerShadow,
              blurRadius: 2,
              spreadRadius: 1,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0, 1),
              inset: true,
            ),
          ],
        );
      case AppButtonType.smallButtonPrimary:
        return BoxDecoration(
          color: context.colors.primaryDefault,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: context.colors.dropShadow,
              blurRadius: 16,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: context.colors.innerShadow,
              blurRadius: 2,
              spreadRadius: 1,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0, 1),
              inset: true,
            ),
          ],
        );
    }
  }

  TextStyle getTextStyle(BuildContext context) {
    if (isSmallButton) {
      return context.textStyles.buttons2;
    }

    switch (widget.textStyle) {
      case AppButtonTextStyle.buttons1:
        return context.textStyles.buttons1;
      case AppButtonTextStyle.buttons2:
        return context.textStyles.buttons2;
      case AppButtonTextStyle.buttons3:
        return context.textStyles.buttons3;
    }
  }

  Widget renderButtonContent() {
    if (widget.isLoading) {
      return AppActivityIndicator(
        size: 23,
        color: getTextColor(),
      );
    }

    Widget? icon;

    if (widget.icon != null) {
      icon = Icon(
        widget.icon,
        color: widget.iconColor ?? getTextColor(),
        size: isSmallButton ? 16 : 24,
      );
    }
    if (widget.svgIcon != null) {
      icon = SVGs.get(
        svg: widget.svgIcon!,
        color: getTextColor(),
        width: isSmallButton ? 16 : 24,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null)
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: icon,
          ),
        Expanded(
          child: Text(
            widget.title,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: getTextStyle(context).copyWith(
              color: getTextColor(),
            ),
          ),
        ),
      ],
    );
  }

  Widget renderWidth({required Widget child}) {
    if (widget.expandWidth && !isSmallButton) {
      return child;
    }

    return IntrinsicWidth(
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return renderWidth(
      child: GestureDetector(
        key: key,
        onTap: widget.isEnabled && !widget.isLoading ? widget.onTap : null,
        onTapDown:
            widget.isEnabled && !widget.isLoading ? (_) => onStartTap() : null,
        onTapUp:
            widget.isEnabled && !widget.isLoading ? (_) => onEndTap() : null,
        onTapCancel: widget.isEnabled && !widget.isLoading ? onEndTap : null,
        child: Container(
          decoration: getButtonDecoration(),
          padding: widget.padding ??
              (isSmallButton
                  ? const EdgeInsets.symmetric(vertical: 5, horizontal: 15)
                  : const EdgeInsets.symmetric(vertical: 11, horizontal: 19)),
          child: Center(
            child: renderButtonContent(),
          ),
        ),
      ),
    );
  }
}

enum AppButtonType {
  /// A button with a filled background
  primary,

  /// A button with a transparent background and a border
  secondary,

  /// A button without a background or a border
  borderless,

  /// A button with a background, svg and text
  smallButton,

  /// A small button with a primary color
  smallButtonPrimary,
}

enum AppButtonTextStyle {
  buttons1,
  buttons2,
  buttons3;
}
