import 'package:flutter/material.dart';
import 'package:qrscan/app/app.dart';
import 'package:qrscan/data/service/secure_storage_service.dart';

import 'core/pigeon/pigeon.g.dart';
import 'helper/listener_scanqr_flutter_api.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final secureStorage = SecureStorageService();
  ScanQrFlutterApi.setUp(ListenerScanQrFlutterApi());
  runApp(App(secureStorage));
}
