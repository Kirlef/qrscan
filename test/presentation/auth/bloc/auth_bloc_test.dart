import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qrscan/core/entities/app_biometric_type.dart';
import 'package:qrscan/domain/repositories/biometric_auth_repository.dart';
import 'package:qrscan/domain/repositories/pin_auth_repository.dart';
import 'package:qrscan/presentation/auth/bloc/auth_bloc.dart';
import 'package:qrscan/presentation/auth/bloc/auth_event.dart';
import 'package:qrscan/presentation/auth/bloc/auth_state.dart';

class MockBiometricRepo extends Mock implements BiometricAuthRepository {}

class MockPinRepo extends Mock implements PinAuthRepository {}

void main() {
  late MockBiometricRepo biometricRepo;
  late MockPinRepo pinRepo;
  late AuthBloc authBloc;

  setUp(() {
    biometricRepo = MockBiometricRepo();
    pinRepo = MockPinRepo();
    authBloc = AuthBloc(biometricRepo, pinRepo);
  });

  group('CheckBiometricSupport', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthBiometricAvailable] when biometric type is not none',
      build: () {
        when(() => biometricRepo.getBiometricType())
            .thenAnswer((_) async => AppBiometricType.faceId);
        return authBloc;
      },
      act: (bloc) => bloc.add(CheckBiometricSupport()),
      expect: () => [isA<AuthBiometricAvailable>()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthBiometricNotAvailable] when biometric type is none',
      build: () {
        when(() => biometricRepo.getBiometricType())
            .thenAnswer((_) async => AppBiometricType.none);
        return authBloc;
      },
      act: (bloc) => bloc.add(CheckBiometricSupport()),
      expect: () => [isA<AuthBiometricNotAvailable>()],
    );
  });

  group('AuthenticateBiometric', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthSuccess] when biometric auth succeeds',
      build: () {
        when(() => biometricRepo.authenticate())
            .thenAnswer((_) async => true);
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthenticateBiometric()),
      expect: () => [isA<AuthSuccess>()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthPinRequired] when biometric auth fails',
      build: () {
        when(() => biometricRepo.authenticate())
            .thenAnswer((_) async => false);
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthenticateBiometric()),
      expect: () => [isA<AuthPinRequired>()],
    );
  });

  group('DefinePin', () {
    blocTest<AuthBloc, AuthState>(
      'saves pin and emits [AuthSuccess]',
      build: () {
        when(() => pinRepo.savePin(any()))
            .thenAnswer((_) async {});
        return authBloc;
      },
      act: (bloc) => bloc.add(DefinePin('1234')),
      expect: () => [isA<AuthSuccess>()],
    );
  });

  group('VerifyPin', () {
    blocTest<AuthBloc, AuthState>(
      'emits [AuthSuccess] when pin matches',
      build: () {
        when(() => pinRepo.getPin())
            .thenAnswer((_) async => '1234');
        return authBloc;
      },
      act: (bloc) => bloc.add(VerifyPin('1234')),
      expect: () => [isA<AuthSuccess>()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthPinMismatch] when pin does not match',
      build: () {
        when(() => pinRepo.getPin())
            .thenAnswer((_) async => '1234');
        return authBloc;
      },
      act: (bloc) => bloc.add(VerifyPin('0000')),
      expect: () => [isA<AuthPinMismatch>()],
    );
  });
}

