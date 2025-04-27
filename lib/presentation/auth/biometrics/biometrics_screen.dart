// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:qrscan/common/enums/biometric_method.dart';
// import 'package:qrscan/presentation/auth/bloc/biometrics/biometrics_bloc.dart';
// import 'package:qrscan/presentation/widgets/app_button.dart';
// import 'package:qrscan/presentation/widgets/auth/auth.dart';

// class BiometricsScreen extends StatelessWidget {
//   const BiometricsScreen({
//     super.key,
//   });

//   void _loaderListener(BuildContext _, BiometricsState state) {/* igual */}

//   bool _loaderListenWhen(BiometricsState previous, BiometricsState current) {
//     return false;
//   }

//   void _dialogErrorListener(BuildContext _, BiometricsState state) {/* igual */}

//   bool _dialogErrorListenWhen(
//       BiometricsState previous, BiometricsState current) {
//         return false;
//       }

//   void _successListener(BuildContext context, BiometricsState state) {
//     return;
//   }

//   bool _successListenWhen(BiometricsState previous, BiometricsState current) {
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<BiometricsBloc>().add(const AuthenticateBiometrics());

//     });
//     const sizedBoxShrink = SizedBox.shrink();
//     return MultiBlocListener(
//       listeners: [
//         BlocListener<BiometricsBloc, BiometricsState>(
//           listener: _loaderListener,
//           listenWhen: _loaderListenWhen,
//         ),
//         BlocListener<BiometricsBloc, BiometricsState>(
//           listener: _dialogErrorListener,
//           listenWhen: _dialogErrorListenWhen,
//         ),
//         BlocListener<BiometricsBloc, BiometricsState>(
//           listener: _successListener,
//           listenWhen: _successListenWhen,
//         ),
//       ],
//       child: BlocBuilder<BiometricsBloc, BiometricsState>(
//         builder: (context, state) => switch (state) {
//           BiometricsInitialState() => sizedBoxShrink,
//           BiometricsLoadingState() => sizedBoxShrink,
//           BiometricsUnavailableState() => sizedBoxShrink,
//           _ => const _BiometricsSettings(),
//         },
//       ),
//     );
//   }
// }

// class _BiometricsSettings extends StatelessWidget {
//   const _BiometricsSettings();
//   //final VoidCallback onSkip;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BiometricsBloc, BiometricsState>(
//       builder: (context, state) => Scaffold(
//         body:SafeArea(child: 
//         Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   children: [
//                     const BiometricsHeader(),
//                     AppButton(
//                       title: 'Más tarde',
//                       onTap: null,
//                       type: AppButtonType.borderless,
//                     ),
//                     const SizedBox(height: 16),
//                     AppButton(
//                       title: switch (state.biometricMethod) {
//                         null => 'Continuar sin biometría',
//                         BiometricMethod.faceID => 'Habilitar Face ID',
//                         BiometricMethod.fingerprint when Platform.isIOS =>
//                           'Habilitar Touch ID',
//                         BiometricMethod.fingerprint =>
//                           'Habilitar Huella Digital',
//                         BiometricMethod.iris => 'Habilitar Escáner de Iris',
//                         _ => 'Habilitar autenticación biométrica',
//                       },
//                       onTap: switch (state.biometricMethod) {
//                         null => null,
//                         _ => () => context
//                             .read<BiometricsBloc>()
//                             .add(const AuthenticateBiometrics()),
//                       },
//                     ),
//                     const SizedBox(height: 36),
//                   ],
//                 ),
//               ),
//             ),
//       ) );
//   }
// }
