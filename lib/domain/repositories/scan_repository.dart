import '../entities/scan_entity.dart';

abstract class ScanRepository {
  Future<void> addScan(ScanEntity scan);
  Future<List<ScanEntity>> getScans();
  Future<void> deleteScan(int id);
}
