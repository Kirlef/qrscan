import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qrscan/common/enums/biometric_method.dart';
import 'package:qrscan/data/service/ibiometrics_auth_service.dart';

part 'biometrics_event.dart';
part 'biometrics_state.dart';

class BiometricsBloc extends Bloc<BiometricsEvent, BiometricsState> {
  BiometricsBloc({
    required IBiometricsAuthService biometricsAuthService,
  })  : _biometricsAuthService = biometricsAuthService,
        super(const BiometricsInitialState()) {
    on<CheckAvailableBiometrics>(_onCheckAvailableBiometrics);
    on<AuthenticateBiometrics>(_onAuthenticateBiometrics);
  }

  final IBiometricsAuthService _biometricsAuthService;

Future<void> _onCheckAvailableBiometrics(
    CheckAvailableBiometrics event,
    Emitter<BiometricsState> emit,
  ) async {
    emit(const BiometricsLoadingState());
    try {
      final biometrics = await _biometricsAuthService.availableBiometrics();
      print(biometrics.toList().toString());
      final biometricMethod = switch (Platform.isAndroid) {
        true => biometrics.android,
        false => biometrics.iOS,
      };
      if (biometricMethod == null) {
        emit(const BiometricsUnavailableState());
      } else {
        emit(BiometricsAvailableState(biometricMethod));
      }
    } catch (_) {
      emit(const BiometricsUnavailableState());
    }
  }

  Future<void> _onAuthenticateBiometrics(
    AuthenticateBiometrics event,
    Emitter<BiometricsState> emit,
  ) async {
    final biometricMethod = state.biometricMethod;
    if (biometricMethod == null) return;

    emit(BiometricsVerifyingState(biometricMethod));
    try {
      final result = await _biometricsAuthService.authenticate(
        localizedReason: 'Confirm your identity to proceed securely.',
      );
      if (result) {
        emit(BiometricsSuccessState(biometricMethod));
      } else {
        emit(BiometricsFailedState(biometricMethod));
      }
    } catch (_) {
      emit(BiometricsErrorState(biometricMethod));
    }
  }
}
