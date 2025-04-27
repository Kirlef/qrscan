part of 'biometrics_bloc.dart';

sealed class BiometricsEvent extends Equatable {
  const BiometricsEvent();

  @override
  List<Object?> get props => [];
}

class CheckAvailableBiometrics extends BiometricsEvent {
  const CheckAvailableBiometrics();
}

class AuthenticateBiometrics extends BiometricsEvent {
  const AuthenticateBiometrics();
}


