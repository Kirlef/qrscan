import 'package:pigeon/pigeon.dart';


@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/core/pigeon/pigeon.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/app/src/main/kotlin/com/seeka/qrscan/core/pigeon/Pigeon.g.kt',
  kotlinOptions: KotlinOptions(package: "com.seeka.qrscan"),

  ///For new feature implementing iOS native code
  // swiftOut: 'ios/Classes/Pigeon.g.swift',
  // swiftOptions: SwiftOptions(),

  // Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
  dartPackageName: 'com_seeka_qrscan',
))

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

@FlutterApi()
abstract class AuthListenerApi {
  void onAuthenticationStateChanged(bool success); // Notificación de autenticación
}

@FlutterApi()
abstract class QrScannerListenerApi {
  void onQrScanResult(String result); // Notificación del resultado del escaneo QR
}
