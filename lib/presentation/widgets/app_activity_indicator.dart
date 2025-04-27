import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/helper/extensions.dart';

class AppActivityIndicator extends StatelessWidget {
  const AppActivityIndicator({
    super.key,
    this.color,
    this.size = 10,
  });

  final Color? color;
  final double size;

  Widget renderIndicator(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(
        color: color ?? context.colors.primaryDefault,
        radius: size * 0.55,
      );
    }

    return CircularProgressIndicator(
      color: color ?? context.colors.primaryDefault,
      strokeWidth: 2.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: renderIndicator(context),
    );
  }
}
