import 'dart:io';

Future<void> main() async {
  // Comando para ejecutar dependiendo del sistema operativo
  final flutterCommand = Platform.isWindows ? 'flutter.bat' : 'flutter';

  // Llamada al comando de Pigeon
  final result = await Process.run(
    flutterCommand, // 'flutter' o 'flutter.bat'
    [
      'pub',
      'run',
      'pigeon',
      '--input',
      'lib/core/pigeon/native_apis.dart', // El archivo de entrada
      '--dart_out',
      'lib/core/pigeon/native_apis.g.dart', // El archivo Dart de salida
      '--kotlin_out',
      'android/app/src/main/kotlin/com/seeka/qrscan/GeneratedPigeon.kt', // El archivo Kotlin de salida
      '--kotlin_package',
      'com.seeka.qrscan', // El paquete Kotlin
    ],
  );

  // Imprimir los resultados
  print(result.stdout);
  print(result.stderr);

  // Salir con el mismo código de salida si hay errores
  if (result.exitCode != 0) {
    exit(result.exitCode);
  }
}
