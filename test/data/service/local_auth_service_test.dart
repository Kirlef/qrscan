import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qrscan/core/entities/app_biometric_type.dart';
import 'package:qrscan/data/service/local_auth_service.dart';

// Generate mock for LocalAuthentication
@GenerateMocks([LocalAuthentication])
import 'local_auth_service_test.mocks.dart';

void main() {
  late MockLocalAuthentication mockLocalAuth;
  late LocalAuthService localAuthService;

  setUp(() {
    mockLocalAuth = MockLocalAuthentication();
    // Inject the mock into the service
    localAuthService = LocalAuthService(auth: mockLocalAuth);
  });

  group('getBiometricType', () {
    test('returns faceId when face is available', () async {
      // Arrange
      when(mockLocalAuth.getAvailableBiometrics()).thenAnswer(
        (_) async => [BiometricType.face],
      );

      // Act
      final result = await localAuthService.getBiometricType();

      // Assert
      expect(result, equals(AppBiometricType.faceId));
      verify(mockLocalAuth.getAvailableBiometrics()).called(1);
    });

    test('returns fingerprint when fingerprint is available', () async {
      // Arrange
      when(mockLocalAuth.getAvailableBiometrics()).thenAnswer(
        (_) async => [BiometricType.fingerprint],
      );

      // Act
      final result = await localAuthService.getBiometricType();

      // Assert
      expect(result, equals(AppBiometricType.fingerprint));
      verify(mockLocalAuth.getAvailableBiometrics()).called(1);
    });

    test('returns none when no biometrics are available', () async {
      // Arrange
      when(mockLocalAuth.getAvailableBiometrics()).thenAnswer(
        (_) async => [],
      );

      // Act
      final result = await localAuthService.getBiometricType();

      // Assert
      expect(result, equals(AppBiometricType.none));
      verify(mockLocalAuth.getAvailableBiometrics()).called(1);
    });

    test('prioritizes face over fingerprint when both are available', () async {
      // Arrange
      when(mockLocalAuth.getAvailableBiometrics()).thenAnswer(
        (_) async => [BiometricType.face, BiometricType.fingerprint],
      );

      // Act
      final result = await localAuthService.getBiometricType();

      // Assert
      expect(result, equals(AppBiometricType.faceId));
      verify(mockLocalAuth.getAvailableBiometrics()).called(1);
    });
  });

  group('authenticate', () {
    test('returns true when authentication is successful', () async {
      // Arrange
      when(mockLocalAuth.authenticate(
        localizedReason: anyNamed('localizedReason'),
        options: anyNamed('options'),
      )).thenAnswer((_) async => true);

      // Act
      final result = await localAuthService.authenticate();

      // Assert
      expect(result, isTrue);
      verify(mockLocalAuth.authenticate(
        localizedReason: 'Autenticarse para continuar',
        options: const AuthenticationOptions(biometricOnly: true),
      )).called(1);
    });

    test('returns false when authentication fails', () async {
      // Arrange
      when(mockLocalAuth.authenticate(
        localizedReason: anyNamed('localizedReason'),
        options: anyNamed('options'),
      )).thenAnswer((_) async => false);

      // Act
      final result = await localAuthService.authenticate();

      // Assert
      expect(result, isFalse);
      verify(mockLocalAuth.authenticate(
        localizedReason: 'Autenticarse para continuar',
        options: const AuthenticationOptions(biometricOnly: true),
      )).called(1);
    });

    test('returns false when an exception occurs', () async {
      // Arrange
      when(mockLocalAuth.authenticate(
        localizedReason: anyNamed('localizedReason'),
        options: anyNamed('options'),
      )).thenThrow(Exception('Authentication error'));

      // Act
      final result = await localAuthService.authenticate();

      // Assert
      expect(result, isFalse);
      verify(mockLocalAuth.authenticate(
        localizedReason: 'Autenticarse para continuar',
        options: const AuthenticationOptions(biometricOnly: true),
      )).called(1);
    });
  });
}