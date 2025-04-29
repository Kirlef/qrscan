abstract class AuthEvent {}

class CheckBiometricSupport extends AuthEvent {}
class AuthenticateBiometric extends AuthEvent {}
class DefinePin extends AuthEvent {
  final String pin;
  DefinePin(this.pin);
}
class VerifyPin extends AuthEvent {
  final String pin;
  VerifyPin(this.pin);
}
