import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qrscan/domain/repositories/biometric_auth_repository.dart';
import 'package:qrscan/domain/repositories/pin_auth_repository.dart';
import 'package:qrscan/presentation/auth/bloc/auth_bloc.dart';
import 'package:qrscan/presentation/auth/bloc/auth_event.dart';
import 'package:qrscan/presentation/auth/bloc/auth_state.dart';
import 'package:qrscan/core/entities/app_biometric_type.dart';
import 'package:mockito/annotations.dart';

import 'auth_bloc_test.mocks.dart';

// Generar los mocks automáticamente para las dependencias
@GenerateMocks([BiometricAuthRepository, PinAuthRepository])
void main() {
  late AuthBloc authBloc;
  late MockBiometricAuthRepository mockBiometricRepo;
  late MockPinAuthRepository mockPinRepo;

  setUp(() {
    mockBiometricRepo = MockBiometricAuthRepository();
    mockPinRepo = MockPinAuthRepository();
    authBloc = AuthBloc(mockBiometricRepo, mockPinRepo);
  });

  group('AuthBloc', () {
    test('emits AuthBiometricAvailable when CheckBiometricSupport is added and biometric is available', () async {
      // Arrange
      when(mockBiometricRepo.getBiometricType()).thenAnswer((_) async => AppBiometricType.faceId);

      // Act
      authBloc.add(CheckBiometricSupport());

      // Assert
      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthBiometricAvailable(AppBiometricType.faceId),
        ]),
      );
    });

    test('emits AuthBiometricNotAvailable when CheckBiometricSupport is added and biometric is not available', () async {
      // Arrange
      when(mockBiometricRepo.getBiometricType()).thenAnswer((_) async => AppBiometricType.none);

      // Act
      authBloc.add(CheckBiometricSupport());

      // Assert
      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthBiometricNotAvailable(),
        ]),
      );
    });

    test('emits AuthSuccess when AuthenticateBiometric is added and authentication is successful', () async {
      // Arrange
      when(mockBiometricRepo.authenticate()).thenAnswer((_) async => true);

      // Act
      authBloc.add(AuthenticateBiometric());

      // Assert
      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthSuccess(),
        ]),
      );
    });

    test('emits AuthPinRequired when AuthenticateBiometric is added and authentication fails', () async {
      // Arrange
      when(mockBiometricRepo.authenticate()).thenAnswer((_) async => false);

      // Act
      authBloc.add(AuthenticateBiometric());

      // Assert
      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthPinRequired(),
        ]),
      );
    });

    test('emits AuthSuccess when DefinePin is added', () async {
      // Arrange
      const pin = '1234';
      when(mockPinRepo.savePin(pin)).thenAnswer((_) async {});

      // Act
      authBloc.add(DefinePin(pin));

      // Assert
      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthSuccess(),
        ]),
      );
    });

    test('emits AuthSuccess when VerifyPin is added and pin is correct', () async {
      // Arrange
      const pin = '1234';
      when(mockPinRepo.getPin()).thenAnswer((_) async => pin);

      // Act
      authBloc.add(VerifyPin(pin));

      // Assert
      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthSuccess(),
        ]),
      );
    });

    test('emits AuthPinMismatch when VerifyPin is added and pin is incorrect', () async {
      // Arrange
      const pin = '1234';
      const incorrectPin = '5678';
      when(mockPinRepo.getPin()).thenAnswer((_) async => pin);

      // Act
      authBloc.add(VerifyPin(incorrectPin));

      // Assert
      await expectLater(
        authBloc.stream,
        emitsInOrder([
          AuthPinMismatch(),
        ]),
      );
    });
  });
}
