import 'package:local_auth/local_auth.dart';
import 'package:qrscan/core/entities/app_biometric_type.dart';
import 'package:qrscan/domain/repositories/biometric_auth_repository.dart';

class LocalAuthService implements BiometricAuthRepository {
  // Modify to make the class testable by allowing dependency injection
  final LocalAuthentication _auth;
  
  // Default constructor will initialize with real implementation
  LocalAuthService({LocalAuthentication? auth}) : _auth = auth ?? LocalAuthentication();

  @override
  Future<AppBiometricType> getBiometricType() async {
    final available = await _auth.getAvailableBiometrics();
    if (available.contains(BiometricType.face)) {
      return AppBiometricType.faceId;
    } else if (available.contains(BiometricType.fingerprint)) {
      return AppBiometricType.fingerprint;
    } else {
      return AppBiometricType.none;
    }
  }

  @override
  Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Autenticarse para continuar',
        options: const AuthenticationOptions(biometricOnly: true),
      );
    } catch (_) {
      return false;
    }
  }
}