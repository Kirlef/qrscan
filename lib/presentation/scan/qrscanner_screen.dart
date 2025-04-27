import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrscan/core/pigeon/native_apis.g.dart';
import 'package:qrscan/presentation/auth/bloc/biometrics/biometrics_bloc.dart';
import 'package:qrscan/presentation/widgets/app_button.dart';


class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  String qrContent = '';
  @override
  void initState() {
    super.initState();
    // Al iniciar, pedimos revisar qué tipo de biometría está disponible
    context.read<BiometricsBloc>().add(const CheckAvailableBiometrics());
  }

 Future<void> scanQrCode() async {
    final api = QrScannerApi();
    final result = await api.scanQr();
    setState(() {
      qrContent = result;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR'),
      ),
      body: 
      // BlocBuilder<BiometricsBloc, BiometricsState>(
      //   builder: (context, state) {
      //     if (state is BiometricsLoadingState) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (state is BiometricsAvailableState) {
          
        //    return
             Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Biometría disponible:',
                      style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
            
                  const SizedBox(height: 20),
                   SizedBox(
          height: 300,
          child: AndroidView(viewType: 'camera_preview'),
        ),

              
 Text('Contenido QR: $qrContent'),
 ElevatedButton(onPressed: scanQrCode, child:  AppButton(title: 'ABRIR',
                  ),)
                  
                ],
              ),
            )
    );
          // } else if (state is BiometricsUnavailableState) {
          //   return const Center(
          //     child: Text('Biometría no disponible en este dispositivo.'),
          //   );
          // } else if (state is BiometricsSuccessState) {
          //   return const Center(
          //     child: Text('Autenticación exitosa 🔒'),
          //   );
          // } else if (state is BiometricsFailedState) {
          //   return const Center(
          //     child: Text('Autenticación fallida ❌'),
          //   );
          // } else if (state is BiometricsErrorState) {
          //   return const Center(
          //     child: Text('Error en la autenticación biométrica.'),
          //   );
          // } else {
          //   return const Center(
          //     child: Text('Esperando interacción...'),
          //   );
          }
}
//         },
//       ),
//     );
//   }
// }