part of 'auth.dart';

// class BiometricsHeader extends StatelessWidget {
//   const BiometricsHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: BlocBuilder<BiometricsCubit, BiometricsState>(
//         builder: (context, state) {
//           // TODO(any): change icon for case here
//           final svg = switch (state.biometricMethod) {
//             null => SvgAssets.faceId,
//             BiometricMethod.faceID => SvgAssets.faceId,
//             BiometricMethod.fingerprint => SvgAssets.fingerprint,
//             BiometricMethod.iris => SvgAssets.faceId,
//             BiometricMethod.strong => SvgAssets.faceId,
//             BiometricMethod.weak => SvgAssets.faceId,
//           };
//           final title = switch (state.biometricMethod) {
//             null => 'Usa una autenticación segura',
//             BiometricMethod.faceID => 'Habilita tu Face ID',
//             BiometricMethod.fingerprint when Platform.isIOS => 'Habilita tu Touch ID',
//             BiometricMethod.fingerprint => 'Habilita tu Huella Digital',
//             BiometricMethod.iris => 'Habilita el Escáner de Iris',
//             _ => 'Habilita la autenticación biométrica',
//           };
//           final description = switch (state.biometricMethod) {
//             null => 'Tu dispositivo no admite autenticación biométrica.\n\n'
//                 'Puedes seguir usando la contraseña para acceder '
//                 'de manera segura.',
//             BiometricMethod.faceID => 'El reconocimiento facial es una '
//                 'alternativa para iniciar sesión de manera '
//                 'rápida, fácil y segura.\n\nAl activarlo, podrás seguir '
//                 'usando la contraseña si quieres.',
//             BiometricMethod.fingerprint when Platform.isIOS => 'La autenticación con '
//                 'Touch ID es una alternativa para iniciar '
//                 'sesión de manera rápida, fácil y segura.\n\n'
//                 'Al activarlo, podrás seguir usando la contraseña si quieres.',
//             BiometricMethod.fingerprint => 'La autenticación con huella digital'
//                 ' es una alternativa para iniciar sesión de manera rápida, '
//                 'fácil y segura.\n\n'
//                 'Al activarlo, podrás seguir usando la contraseña si quieres.',
//             BiometricMethod.iris => 'El escáner de iris es una alternativa '
//                 'para iniciar sesión de manera rápida, fácil y segura.\n\n'
//                 'Al activarlo, podrás seguir usando la contraseña si quieres.',
//             _ => 'Tu dispositivo cuenta con una opción de autenticación '
//                 'avanzada para iniciar sesión de manera rápida, '
//                 'fácil y segura.\n\nAl activarlo, podrás seguir usando '
//                 'la contraseña si quieres.',
//           };
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SVGs.get(svg: svg, width: 88),
//               const SizedBox(height: 32),
//               Text(title, style: context.textStyles.heading2),
//               const SizedBox(height: 8),
//               Text(
//                 description,
//                 style: context.textStyles.body2.copyWith(
//                   color: context.colors.highEmphasis.withOpacity(.64),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

//part of 'auth.dart';

class BiometricsHeader extends StatelessWidget {
  const BiometricsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BiometricsBloc, BiometricsState>(
        builder: (context, state) {
          // final svg = switch (state.biometricMethod) {
          //   null => SvgAssets.faceId,
          //   BiometricMethod.faceID => SvgAssets.faceId,
          //   BiometricMethod.fingerprint => SvgAssets.fingerprint,
          //   BiometricMethod.iris => SvgAssets.faceId,
          //   BiometricMethod.strong => SvgAssets.faceId,
          //   BiometricMethod.weak => SvgAssets.faceId,
          // };
          final title = switch (state.biometricMethod) {
            null => 'Usa una autenticación segura',
            BiometricMethod.faceID => 'Habilita tu Face ID',
            BiometricMethod.fingerprint when Platform.isIOS => 'Habilita tu Touch ID',
            BiometricMethod.fingerprint => 'Habilita tu Huella Digital',
            BiometricMethod.iris => 'Habilita el Escáner de Iris',
            _ => 'Habilita la autenticación biométrica',
          };
          final description = switch (state.biometricMethod) {
            null => 'Tu dispositivo no admite autenticación biométrica.\n\n'
                'Puedes seguir usando la contraseña para acceder '
                'de manera segura.',
            BiometricMethod.faceID => 'El reconocimiento facial es una '
                'alternativa para iniciar sesión de manera '
                'rápida, fácil y segura.\n\nAl activarlo, podrás seguir '
                'usando la contraseña si quieres.',
            BiometricMethod.fingerprint when Platform.isIOS => 'La autenticación con '
                'Touch ID es una alternativa para iniciar '
                'sesión de manera rápida, fácil y segura.\n\n'
                'Al activarlo, podrás seguir usando la contraseña si quieres.',
            BiometricMethod.fingerprint => 'La autenticación con huella digital '
                'es una alternativa para iniciar sesión de manera rápida, '
                'fácil y segura.\n\n'
                'Al activarlo, podrás seguir usando la contraseña si quieres.',
            BiometricMethod.iris => 'El escáner de iris es una alternativa '
                'para iniciar sesión de manera rápida, fácil y segura.\n\n'
                'Al activarlo, podrás seguir usando la contraseña si quieres.',
            _ => 'Tu dispositivo cuenta con una opción de autenticación '
                'avanzada para iniciar sesión de manera rápida, '
                'fácil y segura.\n\nAl activarlo, podrás seguir usando '
                'la contraseña si quieres.',
          };

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SVGs.get(svg: svg, width: 88),
              const SizedBox(height: 32),
              Text(title, style: context.textStyles.heading2),
              const SizedBox(height: 8),
              Text(
                description,
                style: context.textStyles.body2.copyWith(
                  color: context.colors.highEmphasis.withOpacity(.64),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
