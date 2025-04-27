import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:qrscan/common/enums/biometric_method.dart';
import 'package:qrscan/data/service/ibiometrics_auth_service.dart';

class BiometricsAuthService implements IBiometricsAuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<bool> checkBiometrics() async {
    final (canAuthenticateWithBiometrics, deviceSupported) = await (
      _localAuth.canCheckBiometrics,
      this.deviceSupported(),
    ).wait;
    return canAuthenticateWithBiometrics || deviceSupported;
  }

  @override
  Future<bool> deviceSupported() async {
    final isDeviceSupported = await _localAuth.isDeviceSupported();
    return isDeviceSupported;
  }

  @override
  Future<bool> biometricEnrolled() async {
    final availableBiometrics = await _localAuth.getAvailableBiometrics();
    return availableBiometrics.isNotEmpty;
  }

  @override
  Future<List<BiometricMethod>> availableBiometrics() async {
    final biometrics = await _localAuth.getAvailableBiometrics();
    if (biometrics.isEmpty) return [];
    final biometricsMethods = <BiometricMethod>[];
    for (var biometric in biometrics) {
      biometricsMethods.add(
        switch (biometric) {
          BiometricType.face => BiometricMethod.faceID,
          BiometricType.fingerprint => BiometricMethod.fingerprint,
          BiometricType.iris => BiometricMethod.iris,
          BiometricType.strong => BiometricMethod.strong,
          BiometricType.weak => BiometricMethod.weak,
        },
      );
    }
    return biometricsMethods;
  }

  @override
  Future<bool> authenticate({
    required String localizedReason,
    BiometricType? preferredBiometric,
  }) async {
    try {
      return await _localAuth.authenticate(
        localizedReason: localizedReason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        return false;
      }
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> biometricsEnabled(bool enabled) async {
    try {
      await _secureStorage.write(
        key: 'biometric_enabled',
        value: enabled.toString(),
      );
    } catch (e) {
      log("error $e");
    }
  }

  @override
  Future<bool> biometricsEnable() async {
    try {
      final value = await _secureStorage.read(key: 'biometric_enabled');
      return value == 'true';
    } catch (e) {
      return false;
    }
  }
}
