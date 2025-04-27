import 'package:qrscan/common/enums/biometric_method.dart';

abstract class IBiometricsAuthService {
  Future<bool> checkBiometrics();
  Future<bool> biometricEnrolled();
  Future<bool> deviceSupported();
  Future<List<BiometricMethod>> availableBiometrics();
  Future<bool> authenticate({required String localizedReason});
  Future<void> biometricsEnabled(bool enabled);
  Future<bool> biometricsEnable();
}
