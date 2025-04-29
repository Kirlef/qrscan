import 'package:flutter/material.dart';
import 'package:qrscan/common/app_theme/app_theme.dart';

extension NavigationArguments on BuildContext {
  T routeArguments<T>() {
    return ModalRoute.of(this)?.settings.arguments as T;
  }
}

extension AppThemeData on BuildContext {
  AppColors get colors {
    return Theme.of(this).extension<AppTheme>()!.colors;
  }

  AppTextStyles get textStyles {
    return Theme.of(this).extension<AppTheme>()!.textStyles;
  }
}

extension StringExtensions on String {
  String get hiddenCardNumber {
    try {
      String number = this;
      number = number.replaceAll(' ', '');

      number = number.substring(number.length - 4, number.length);
      return '**** $number';
    } catch (_) {
      return this;
    }
  }

  double get toDouble {
    return double.tryParse(
          replaceAll(RegExp(r'[^0-9.]'), ''),
        ) ??
        0;
  }

  bool get isConsecutiveNumbers {
    for (int i = 0; i < length - 1; i++) {
      if (int.parse(this[i + 1]) - int.parse(this[i]) != 1) {
        return false;
      }
    }
    return true;
  }

  bool get isRepeatedNumbers {
    return split('').every((char) => char == this[0]);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String normalize() {
    return toLowerCase()
        .replaceAll(RegExp(r'[áàäâ]'), 'a')
        .replaceAll(RegExp(r'[éèëê]'), 'e')
        .replaceAll(RegExp(r'[íìïî]'), 'i')
        .replaceAll(RegExp(r'[óòöô]'), 'o')
        .replaceAll(RegExp(r'[úùüû]'), 'u');
  }
}



extension FormattedAmounts on double {
  String get decimalString {
    String string = '$this'.split('.').last;

    if (string.isEmpty) {
      return '00';
    } else if (string.length == 1) {
      return '${string}0';
    } else {
      return string.substring(0, 2);
    }
  }

  String get mainString {
    int counter = 0;
    String string = '$this'.split('.').first;
    String returnString = '';

    for (int i = string.length - 1; i >= 0; i--) {
      if (returnString.isNotEmpty && counter == 3) {
        counter = 0;
        returnString = '.$returnString';
      }

      returnString = '${string[i]}$returnString';
      counter++;
    }

    return returnString;
  }

}

extension IterableX<E> on Iterable<E> {
 
  List<T> indexedList<T>(T Function((int, E)) f) {
    return indexed.map(f).toList();
  }

  List<T> mapList<T>(T Function(E element) f) {
    return map(f).toList();
  }

  List<E> whereList(bool Function(E element) f) {
    return where(f).toList();
  }

  E? firstWhereOrNull(bool Function(E element) f) {
    for (final element in this) {
      if (f(element)) return element;
    }
    return null;
  }
}
