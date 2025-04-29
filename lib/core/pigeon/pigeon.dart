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

// HostApi para escanear QR
@HostApi()
abstract class QrScannerApi {
  @async
  String scanQr();            
}

// FlutterApi para recibir respuestas

@FlutterApi()
abstract class ScanQrFlutterApi {
  void onScanSuccess(String qrData);
  void onScanError(String errorMessage);
}


