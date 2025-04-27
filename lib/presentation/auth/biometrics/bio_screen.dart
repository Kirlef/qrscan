import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrscan/presentation/auth/bloc/biometrics/biometrics_bloc.dart';


class BiometricsScreen extends StatefulWidget {
  const BiometricsScreen({Key? key}) : super(key: key);

  @override
  State<BiometricsScreen> createState() => _BiometricsScreenState();
}

class _BiometricsScreenState extends State<BiometricsScreen> {
  @override
  void initState() {
    super.initState();
    // Al iniciar, pedimos revisar qué tipo de biometría está disponible
    context.read<BiometricsBloc>().add(const CheckAvailableBiometrics());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometría'),
      ),
      body: BlocBuilder<BiometricsBloc, BiometricsState>(
        builder: (context, state) {
          if (state is BiometricsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BiometricsAvailableState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Biometría disponible:',
                      style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text(
                    state.biometricMethod
                        .name, // Mostramos el tipo de biometría disponible
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Si quieres hacer autenticación real aquí
                      context
                          .read<BiometricsBloc>()
                          .add(const AuthenticateBiometrics());
                    },
                    child: const Text('Autenticar'),
                  )
                ],
              ),
            );
          } else if (state is BiometricsUnavailableState) {
            return const Center(
              child: Text('Biometría no disponible en este dispositivo.'),
            );
          } else if (state is BiometricsSuccessState) {
            return const Center(
              child: Text('Autenticación exitosa 🔒'),
            );
          } else if (state is BiometricsFailedState) {
            return const Center(
              child: Text('Autenticación fallida ❌'),
            );
          } else if (state is BiometricsErrorState) {
            return const Center(
              child: Text('Error en la autenticación biométrica.'),
            );
          } else {
            return const Center(
              child: Text('Esperando interacción...'),
            );
          }
        },
      ),
    );
  }
}
