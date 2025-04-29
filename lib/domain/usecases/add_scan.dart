import '../entities/scan_entity.dart';
import '../repositories/scan_repository.dart';

class AddScan {
  final ScanRepository repository;

  AddScan(this.repository);

  Future<void> call(ScanEntity scan) => repository.addScan(scan);
}