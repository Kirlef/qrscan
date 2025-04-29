import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:qrscan/core/entities/app_biometric_type.dart';
import 'package:qrscan/domain/repositories/biometric_auth_repository.dart';
import 'package:qrscan/domain/repositories/pin_auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BiometricAuthRepository biometricRepo;
  final PinAuthRepository pinRepo;

  AuthBloc(this.biometricRepo, this.pinRepo) : super(AuthInitial()) {
    on<CheckBiometricSupport>((event, emit) async {
      final type = await biometricRepo.getBiometricType();
      if (type != AppBiometricType.none){
        emit(AuthBiometricAvailable(type));
      } else {
        emit(AuthBiometricNotAvailable());
      }
    });

    on<AuthenticateBiometric>((event, emit) async {
      final success = await biometricRepo.authenticate();
      if (success) {
        emit(AuthSuccess());
      } else {
        emit(AuthPinRequired());
      }
    });

    on<DefinePin>((event, emit) async {
      await pinRepo.savePin(event.pin);
      emit(AuthSuccess());
    });

    on<VerifyPin>((event, emit) async {
      final savedPin = await pinRepo.getPin();
      if (savedPin == event.pin) {
        emit(AuthSuccess());
      } else {
        emit(AuthPinMismatch());
      }
    });
  }
}