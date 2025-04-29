import 'package:qrscan/data/datasource/scan_dao.dart';
import 'package:qrscan/domain/repositories/scan_repository.dart';

import '../../domain/entities/scan_entity.dart';
import '../models/scan_model.dart';

class ScanRepositoryImpl implements ScanRepository {
  final ScanDao dao;

  ScanRepositoryImpl(this.dao);

  @override
  Future<void> addScan(ScanEntity scan) async {
    await dao.insertScan(ScanModel(
      id: scan.id,
      contentBase64: scan.contentBase64,
      scannedAt: scan.scannedAt,
    ));
  }

  @override
  Future<List<ScanEntity>> getScans() async => dao.getScans();

  @override
  Future<void> deleteScan(int id) async => dao.deleteScan(id);
}
