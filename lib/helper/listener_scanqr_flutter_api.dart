
import 'dart:async';
import 'dart:convert';

import 'package:qrscan/core/pigeon/pigeon.g.dart';
import 'package:qrscan/helper/scan_bloc_helper.dart';
import 'package:qrscan/presentation/scan/bloc/scan_event.dart';


class ListenerScanQrFlutterApi extends ScanQrFlutterApi {
  @override
  Future<void> onScanSuccess(String qrContent) async {
    final bloc = ScanBlocHolder.instance;
    if (bloc != null) {
      final encoded = base64Encode(utf8.encode(qrContent));
      bloc.add(AddScanEvent(encoded));
    } else {
      print('ScanBloc todavía no está inicializado');
    }
  }

  @override
  void onScanError(String errorMessage) {}
}
