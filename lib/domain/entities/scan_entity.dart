class ScanEntity {
  final int id;
  final String contentBase64;
  final DateTime scannedAt;

  ScanEntity({
    required this.id,
    required this.contentBase64,
    required this.scannedAt,
  });
}