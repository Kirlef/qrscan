import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrscan/common/app_theme/app_theme.dart';
import 'package:qrscan/config/routes.dart';
import 'package:qrscan/data/datasource/scan_dao.dart';
import 'package:qrscan/data/repositories/scan_repository_impl.dart';
import 'package:qrscan/data/service/local_auth_service.dart';
import 'package:qrscan/data/service/secure_storage_service.dart';
import 'package:qrscan/domain/usecases/add_scan.dart';
import 'package:qrscan/domain/usecases/delete_scan.dart';
import 'package:qrscan/domain/usecases/get_scan.dart';
import 'package:qrscan/helper/database_helper.dart';
import 'package:qrscan/helper/scan_bloc_helper.dart';
import 'package:qrscan/presentation/auth/bloc/auth_bloc.dart';
import 'package:qrscan/presentation/auth/bloc/auth_event.dart';
import 'package:qrscan/presentation/auth/pincode/pin_screen.dart';
import 'package:qrscan/presentation/scan/bloc/scan_bloc.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:qrscan/presentation/scan/qr_list_screen.dart';
import 'package:qrscan/presentation/auth/biometrics/biometrics_screen.dart';

class App extends StatelessWidget {
  final SecureStorageService secureStorage;

  const App(this.secureStorage, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Database>(
      future: DatabaseHelper.database,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        final database = snapshot.data!;
        final scanDao = ScanDao(database);
        final scanRepository = ScanRepositoryImpl(scanDao);
        final addScan = AddScan(scanRepository);
        final getScans = GetScans(scanRepository);
        final deleteScan = DeleteScan(scanRepository);
        final scanBloc = ScanBloc(
          addScan: addScan,
          getScans: getScans,
          deleteScan: deleteScan,
        );

        ScanBlocHolder.instance = scanBloc;

        final localAuthService = LocalAuthService();

        return MultiBlocProvider(
          providers: [
            BlocProvider<ScanBloc>(
              create: (context) => scanBloc,
            ),
            BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(localAuthService, secureStorage)
                ..add(CheckBiometricSupport()),
            ),
          ],
          child: MaterialApp(
            theme: ThemeData(
              extensions: <ThemeExtension<dynamic>>[
                AppTheme.fromBrightness(Brightness.light),
              ],
            ),
            darkTheme: ThemeData(
              extensions: <ThemeExtension<dynamic>>[
                AppTheme.fromBrightness(Brightness.dark),
              ],
            ),
            themeMode: ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home:
                BiometricsScreen(), // Cambiar según lo que quieras mostrar inicialmente
            onGenerateRoute: (routeSetting) {
              switch (routeSetting.name) {
                case AppRoutes.auth:
                  return MaterialPageRoute(builder: (BuildContext context) {
                    return const BiometricsScreen();
                  });
                case AppRoutes.list:
                  return MaterialPageRoute(builder: (BuildContext context) {
                    return const QrListScreen();
                  });
                case AppRoutes.pin:
                  return MaterialPageRoute(builder: (BuildContext context) {
                    return const PinScreen();
                  });
                default:
                  return MaterialPageRoute(
                      builder: (context) => const QrListScreen());
              }
            },
          ),
        );
      },
    );
  }
}
