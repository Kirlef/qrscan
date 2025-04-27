import 'package:qrscan/helper/extensions.dart';

enum BiometricMethod { faceID, fingerprint, iris, strong, weak }

extension BiometricsMethodX on List<BiometricMethod> {
  BiometricMethod? get android => firstWhereOrNull(
        (type) {
          return type == BiometricMethod.fingerprint ||
              type == BiometricMethod.iris ||
              type == BiometricMethod.strong ||
              type == BiometricMethod.weak;
        },
      );
  BiometricMethod? get iOS => firstWhereOrNull(
        (type) {
          return type == BiometricMethod.faceID ||
              type == BiometricMethod.fingerprint ||
              type == BiometricMethod.strong ||
              type == BiometricMethod.weak;
        },
      );
}
