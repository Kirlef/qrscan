import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/core/pigeon/pigeon.g.dart';
import 'package:qrscan/helper/extensions.dart';
import 'package:qrscan/presentation/auth/biometrics/biometrics_screen.dart';
import 'package:qrscan/presentation/auth/bloc/auth_bloc.dart';
import 'package:qrscan/presentation/auth/bloc/auth_event.dart';
import 'package:qrscan/presentation/scan/bloc/scan_bloc.dart';
import 'package:qrscan/presentation/scan/bloc/scan_event.dart';
import 'package:qrscan/presentation/scan/bloc/scan_state.dart';
import 'package:qrscan/presentation/widgets/app_card.dart';

class QrListScreen extends StatelessWidget {
  const QrListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.read<ScanBloc>().add(LoadScans());
    });

    return Scaffold(
      backgroundColor: context.colors.darkestNeutrals90,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.colors.darkestNeutrals90,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'QR List',
              style: context.textStyles.heading2.copyWith(color: Colors.white),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout, color:Colors.white
            ),
            onPressed: () {
              final bloc = context.read<AuthBloc>();
              bloc.add(CheckBiometricSupport());
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const BiometricsScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ScanBloc, ScanState>(
        builder: (context, state) {
          if (state is ScanLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ScanLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: state.scans.length,
              itemBuilder: (context, index) {
                final scan = state.scans[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0), // Espacio arriba/abajo
                  child: AppCard(
                    borderType: AppCardBorderType.gradient,
                    child: ListTile(
                      title: Text(
                        utf8.decode(base64Decode(scan.contentBase64)),
                        style: context.textStyles.body2
                            .copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                          DateFormat('dd MMM yyyy, HH:mm')
                              .format(scan.scannedAt),
                          style: context.textStyles.body2
                              .copyWith(color: context.colors.whiteNeutrals00)),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.white),
                        onPressed: () {
                          context
                              .read<ScanBloc>()
                              .add(DeleteScanEvent(scan.id));
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No QR codes yet'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => scanQrCode(context),
        child: const Icon(Icons.qr_code),
      ),
    );
  }

  Future<void> scanQrCode(BuildContext context) async {
    final hasPermission = await requestCameraPermission();
    if (!hasPermission) return;

    final api = QrScannerApi();
    await api.scanQr();
  }

  Future<bool> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) return true;
    if (status.isDenied) status = await Permission.camera.request();
    if (status.isPermanentlyDenied) await openAppSettings();
    return status.isGranted;
  }
}
