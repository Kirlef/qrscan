part of 'biometrics_bloc.dart';

sealed class BiometricsState extends Equatable {
  const BiometricsState();

  @override
  List<Object?> get props => [];
}

class BiometricsInitialState extends BiometricsState {
  const BiometricsInitialState();
}

class BiometricsLoadingState extends BiometricsState {
  const BiometricsLoadingState();
}

class BiometricsAvailableState extends BiometricsState {
  final BiometricMethod biometricMethod;
  const BiometricsAvailableState(this.biometricMethod);

  @override
  List<Object?> get props => [biometricMethod];
}

class BiometricsUnavailableState extends BiometricsState {
  const BiometricsUnavailableState();
}

class BiometricsVerifyingState extends BiometricsState {
  final BiometricMethod biometricMethod;
  const BiometricsVerifyingState(this.biometricMethod);

  @override
  List<Object?> get props => [biometricMethod];
}

class BiometricsSuccessState extends BiometricsState {
  final BiometricMethod biometricMethod;
  const BiometricsSuccessState(this.biometricMethod);

  @override
  List<Object?> get props => [biometricMethod];
}

class BiometricsFailedState extends BiometricsState {
  final BiometricMethod biometricMethod;
  const BiometricsFailedState(this.biometricMethod);

  @override
  List<Object?> get props => [biometricMethod];
}

class BiometricsErrorState extends BiometricsState {
  final BiometricMethod biometricMethod;
  const BiometricsErrorState(this.biometricMethod);

  @override
  List<Object?> get props => [biometricMethod];
}

extension BiometricsStateX on BiometricsState {
  BiometricMethod? get biometricMethod => switch (this) {
        BiometricsVerifyingState(:final biometricMethod) => biometricMethod,
        BiometricsAvailableState(:final biometricMethod) => biometricMethod,
        BiometricsSuccessState(:final biometricMethod) => biometricMethod,
        BiometricsFailedState(:final biometricMethod) => biometricMethod,
        BiometricsErrorState(:final biometricMethod) => biometricMethod,
        _ => null,
      };
}
