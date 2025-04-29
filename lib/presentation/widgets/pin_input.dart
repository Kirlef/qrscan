
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pinput/pinput.dart';
import 'package:qrscan/helper/extensions.dart';

class PinInput extends StatefulWidget {
  final Function(String)? onCompleted;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool hasError;
  final bool isLoading;
  final bool enabled;
  final bool obscureText;
  final int cellCount;

  const PinInput({
    super.key,
    this.onCompleted,
    this.onChanged,
    this.focusNode,
    this.controller,
    this.hasError = false,
    this.isLoading = false,
    this.enabled = true,
    this.obscureText = false,
    this.cellCount = 4,
  });

  @override
  State<PinInput> createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  late FocusNode focusNode = widget.focusNode ?? FocusNode();
  late TextEditingController controller =
      widget.controller ?? TextEditingController();

  String? validatePasscode(String? value) {
    if (value == null || value.isEmpty) return '';

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final PinTheme pinTheme = PinTheme(
      width: 48,
      height: 56,
      textStyle: context.textStyles.digits1,
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.hasError
              ? context.colors.dangerDefault
              : context.colors.greyerNeutrals50,
        ),
        color: !widget.enabled
            ? context.colors.greyerNeutrals50
            : context.colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Row(
      children: [
        Expanded(
          child: Pinput(
            length: widget.cellCount,
            onChanged: widget.onChanged,
            focusNode: focusNode,
            controller: controller,
            onTapOutside: (event) => focusNode.unfocus(),
            enabled: !widget.isLoading && widget.enabled,
            showCursor: false,
            toolbarEnabled: false,
            useNativeKeyboard: true,
            defaultPinTheme: pinTheme,
            validator: validatePasscode,
            focusedPinTheme: pinTheme.copyDecorationWith(
              border: Border.all(
                color: widget.hasError
                    ? context.colors.dangerDefault
                    : context.colors.primaryDefault,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            submittedPinTheme: pinTheme.copyWith(
              decoration: pinTheme.decoration,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
            ],
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            onCompleted: widget.onCompleted,
            obscureText: widget.obscureText,
          ),
        ),
      ],
    );
  }
}
