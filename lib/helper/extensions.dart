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

  // String currencyWithOutSymbol() {
  //   final format = NumberFormat.currency(
  //       locale: 'es_MX', decimalDigits: this == toInt() ? 0 : 2, symbol: '');
  //   return format.format(this);
  // }
}

// extension CaptureAndShareX on WidgetsToImageController {
//   Future<ShareResult> captureAndShareImage({
//     String imageName = 'Nueva imagen',
//     String imageSubject = '',
//   }) async {
//     final bytes = await capture();

//     return _shareImage(
//       imageName: imageName,
//       imageSubject: imageSubject,
//       bytes: bytes!,
//     );
//   }

//   Future<ShareResult> _shareImage({
//     required String imageName,
//     required String imageSubject,
//     required Uint8List bytes,
//   }) async {
//     try {
//       final result = await Share.shareXFiles(
//         [XFile.fromData(bytes, name: imageName, mimeType: "image/png")],
//         subject: imageSubject,
//       );

//       return result;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

/// `IterableX` extension adds additional functionalities to `Iterable<E>`.
extension IterableX<E> on Iterable<E> {
  /// Applies a function `f` to each element in the collection along with its index
  /// and returns a list with the results.
  ///
  /// ### **Usage Example:**
  /// ```dart
  /// final list = ['a', 'b', 'c'];
  /// final indexedList = list.indexedList((tuple) => '${tuple.$1}: ${tuple.$2}');
  /// print(indexedList); // ['0: a', '1: b', '2: c']
  /// ```
  ///
  /// ### **Parameters:**
  /// - `f`: A function that receives a tuple `(int, E)` and returns a value `T`.
  ///
  /// ### **Returns:**
  /// - A `List<T>` containing the results of applying `f` to each element in the collection.
  List<T> indexedList<T>(T Function((int, E)) f) {
    return indexed.map(f).toList();
  }

  /// Applies a function `f` to each element in the collection and returns a list
  /// with the results. A shortcut for `map(f).toList()`.
  ///
  /// ### **Usage Example:**
  /// ```dart
  /// final list = [1, 2, 3];
  /// final doubled = list.mapList((e) => e * 2);
  /// print(doubled); // [2, 4, 6]
  /// ```
  ///
  /// ### **Parameters:**
  /// - `f`: A function that receives an element `E` and returns a value `T`.
  ///
  /// ### **Returns:**
  /// - A `List<T>` containing the results of applying `f` to each element in the collection.
  List<T> mapList<T>(T Function(E element) f) {
    return map(f).toList();
  }

  /// Filters the elements in the collection based on the condition `f` and returns a list
  /// containing the elements that satisfy the condition. A shortcut for `where(f).toList()`.
  ///
  /// ### **Usage Example:**
  /// ```dart
  /// final list = [1, 2, 3, 4, 5];
  /// final evens = list.whereList((e) => e.isEven);
  /// print(evens); // [2, 4]
  /// ```
  ///
  /// ### **Parameters:**
  /// - `f`: A function that receives an element `E` and returns `true` if it should be included in the list.
  ///
  /// ### **Returns:**
  /// - A `List<E>` containing the elements that satisfy the condition.
  List<E> whereList(bool Function(E element) f) {
    return where(f).toList();
  }

  /// Returns the first element that satisfies the condition `f`, or `null` if no match is found.
  ///
  /// ### **Usage Example:**
  /// ```dart
  /// final list = [1, 2, 3, 4, 5];
  /// final firstEven = list.firstWhereOrNull((e) => e.isEven);
  /// print(firstEven); // 2
  ///
  /// final notFound = list.firstWhereOrNull((e) => e > 10);
  /// print(notFound); // null
  /// ```
  ///
  /// ### **Parameters:**
  /// - `f`: A function that receives an element `E` and returns `true` if it is the desired element.
  ///
  /// ### **Returns:**
  /// - The first element `E` that satisfies `f`, or `null` if no match is found.
  E? firstWhereOrNull(bool Function(E element) f) {
    for (final element in this) {
      if (f(element)) return element;
    }
    return null;
  }
}
