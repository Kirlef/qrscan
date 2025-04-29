import '../repositories/scan_repository.dart';

class DeleteScan {
  final ScanRepository repository;

  DeleteScan(this.repository);

  Future<void> call(int id) => repository.deleteScan(id);
}