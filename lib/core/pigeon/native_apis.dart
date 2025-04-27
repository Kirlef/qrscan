import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class AuthApi {
  /// Verifica si la autenticación biométrica está disponible
  bool isBiometricAvailable();

  /// Ejecuta la autenticación biométrica
  bool authenticate();
}

@HostApi()
abstract class QrScannerApi {
  /// Ejecuta el escaneo de un código QR
  String scanQr();
}
