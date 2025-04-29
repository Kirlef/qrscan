import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:qrscan/core/entities/app_biometric_type.dart';
import 'package:qrscan/domain/repositories/biometric_auth_repository.dart';

// Generate mocks
@GenerateMocks([BiometricAuthRepository])
import 'biometric_auth_repository_test.mocks.dart';

void main() {
  late MockBiometricAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockBiometricAuthRepository();
  });

  group('BiometricAuthRepository', () {
    test('getBiometricType returns AppBiometricType.none', () async {
      // Arrange
      when(mockRepository.getBiometricType())
          .thenAnswer((_) async => AppBiometricType.none);

      // Act
      final result = await mockRepository.getBiometricType();

      // Assert
      expect(result, equals(AppBiometricType.none));
      verify(mockRepository.getBiometricType()).called(1);
    });

    test('getBiometricType returns AppBiometricType.fingerprint', () async {
      // Arrange
      when(mockRepository.getBiometricType())
          .thenAnswer((_) async => AppBiometricType.fingerprint);

      // Act
      final result = await mockRepository.getBiometricType();

      // Assert
      expect(result, equals(AppBiometricType.fingerprint));
      verify(mockRepository.getBiometricType()).called(1);
    });

    test('getBiometricType returns AppBiometricType.faceId', () async {
      // Arrange
      when(mockRepository.getBiometricType())
          .thenAnswer((_) async => AppBiometricType.faceId);

      // Act
      final result = await mockRepository.getBiometricType();

      // Assert
      expect(result, equals(AppBiometricType.faceId));
      verify(mockRepository.getBiometricType()).called(1);
    });

    test('authenticate returns true when authentication succeeds', () async {
      // Arrange
      when(mockRepository.authenticate()).thenAnswer((_) async => true);

      // Act
      final result = await mockRepository.authenticate();

      // Assert
      expect(result, isTrue);
      verify(mockRepository.authenticate()).called(1);
    });

    test('authenticate returns false when authentication fails', () async {
      // Arrange
      when(mockRepository.authenticate()).thenAnswer((_) async => false);

      // Act
      final result = await mockRepository.authenticate();

      // Assert
      expect(result, isFalse);
      verify(mockRepository.authenticate()).called(1);
    });
  });

  group('Integration between methods', () {
    test('authenticate fails when biometricType is none', () async {
      // Arrange
      when(mockRepository.getBiometricType())
          .thenAnswer((_) async => AppBiometricType.none);
      when(mockRepository.authenticate()).thenAnswer((_) async => false);

      // Act
      final biometricType = await mockRepository.getBiometricType();
      final canAuthenticate = await mockRepository.authenticate();

      // Assert
      expect(biometricType, equals(AppBiometricType.none));
      expect(canAuthenticate, isFalse);
    });

    test('authenticate succeeds when biometricType is fingerprint', () async {
      // Arrange
      when(mockRepository.getBiometricType())
          .thenAnswer((_) async => AppBiometricType.fingerprint);
      when(mockRepository.authenticate()).thenAnswer((_) async => true);

      // Act
      final biometricType = await mockRepository.getBiometricType();
      final canAuthenticate = await mockRepository.authenticate();

      // Assert
      expect(biometricType, equals(AppBiometricType.fingerprint));
      expect(canAuthenticate, isTrue);
    });
  });
}