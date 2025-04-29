
import 'package:qrscan/core/entities/app_biometric_type.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthBiometricAvailable extends AuthState {
  final AppBiometricType type;
  AuthBiometricAvailable(this.type);
}
class AuthBiometricNotAvailable extends AuthState {}
class AuthPinRequired extends AuthState {}
class AuthPinMismatch extends AuthState {}
class AuthSuccess extends AuthState {}
