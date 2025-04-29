import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrscan/domain/entities/scan_entity.dart';
import 'package:qrscan/domain/usecases/add_scan.dart';
import 'package:qrscan/domain/usecases/delete_scan.dart';
import 'package:qrscan/domain/usecases/get_scan.dart';
import 'scan_event.dart';
import 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final AddScan addScan;
  final GetScans getScans;
  final DeleteScan deleteScan;

  ScanBloc({required this.addScan, required this.getScans, required this.deleteScan}) : super(ScanInitial()) {
    on<LoadScans>((event, emit) async {
      emit(ScanLoading());
      try {
        final scans = await getScans();
        emit(ScanLoaded(scans));
      } catch (_) {
        emit(ScanError());
      }
    });

    on<AddScanEvent>((event, emit) async {
      final scan = ScanEntity(
        id: DateTime.now().millisecondsSinceEpoch,
        contentBase64: event.qrContent,
        scannedAt: DateTime.now(),
      );
      await addScan(scan);
      add(LoadScans());
    });

    on<DeleteScanEvent>((event, emit) async {
      await deleteScan(event.id);
      add(LoadScans());
    });
  }
}