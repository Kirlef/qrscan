import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrscan/config/routes.dart';
import 'package:qrscan/domain/service/ibiometrics_auth_service_impl.dart';
import 'package:qrscan/presentation/auth/biometrics/bio_screen.dart';
import 'package:qrscan/presentation/auth/bloc/biometrics/biometrics_bloc.dart';
import 'package:qrscan/presentation/scan/qrscanner_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BiometricsBloc(biometricsAuthService: BiometricsAuthService()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BiometricsScreen(),
          onGenerateRoute: (routeSetting) {
            switch (routeSetting.name) {
              case (AppRoutes.auth):
                return MaterialPageRoute(builder: (BuildContext context) {
                  return// const BiometricsScreen();
                  const QrScannerScreen();
                });
              // case (AppRoutes.add):
              //   return MaterialPageRoute(builder: (BuildContext context) {
              //     return const AddTaskScreen();
              //   });

              default:
                return MaterialPageRoute(
                    builder: ((context) => const BiometricsScreen()));
            }
          },
        ));
  }
}
