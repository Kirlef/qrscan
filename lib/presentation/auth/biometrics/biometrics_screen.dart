import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrscan/core/entities/app_biometric_type.dart';
import 'package:qrscan/helper/extensions.dart';
import 'package:qrscan/presentation/auth/bloc/auth_bloc.dart';
import 'package:qrscan/presentation/auth/bloc/auth_event.dart';
import 'package:qrscan/presentation/auth/bloc/auth_state.dart';
import 'package:qrscan/presentation/auth/pincode/pin_screen.dart';
import 'package:qrscan/presentation/scan/qr_list_screen.dart';
import 'package:qrscan/presentation/widgets/app_button.dart';

class BiometricsScreen extends StatelessWidget {
  const BiometricsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.darkestNeutrals90,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const QrListScreen()),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthBiometricAvailable) {
            return _buildBiometricButton(context, type: state.type);
          } else if (state is AuthBiometricNotAvailable) {
            return _buildPinButton(context);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildBiometricButton(BuildContext context,
      {required AppBiometricType type}) {
    IconData icon;
    String label;

    switch (type) {
      case AppBiometricType.faceId:
        icon = Icons.face;
        label = 'Autenticarse con Face ID';
        break;
      case AppBiometricType.fingerprint:
        icon = Icons.fingerprint;
        label = 'Autenticarse con huella';
        break;
      default:
        icon = Icons.lock;
        label = 'Autenticarse con PIN';
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 100),
            const SizedBox(height: 20),
            Text(
              'Método disponible: ${type.name}',
              style: context.textStyles.body2
                  .copyWith(color: context.colors.lightNeutrals30),
            ),
            const SizedBox(height: 20),
            if (type != AppBiometricType.none)
              AppButton(
                title: label,
                type: AppButtonType.secondary,
                onTap: () {
                  context.read<AuthBloc>().add(AuthenticateBiometric());
                },
              ),
            const SizedBox(height: 20),
            AppButton(
              title: 'O usar PIN',
              type: AppButtonType.secondary,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PinScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinButton(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Text(
              'Biometría no disponible',
              style: context.textStyles.heading2
                  .copyWith(color: context.colors.lightNeutrals30),
            ),
            const SizedBox(height: 20),
            AppButton(
              title: 'Autenticarse con PIN',
              type: AppButtonType.secondary,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PinScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
