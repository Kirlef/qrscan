import 'package:qrscan/core/entities/app_biometric_type.dart';

abstract class BiometricAuthRepository {
  Future<AppBiometricType> getBiometricType();
  Future<bool> authenticate();
}
