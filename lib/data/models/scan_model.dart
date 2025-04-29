import '../../domain/entities/scan_entity.dart';

class ScanModel extends ScanEntity {
  ScanModel({
    required int id,
    required String contentBase64,
    required DateTime scannedAt,
  }) : super(id: id, contentBase64: contentBase64, scannedAt: scannedAt);

  factory ScanModel.fromMap(Map<String, dynamic> map) => ScanModel(
    id: map['id'],
    contentBase64: map['content_base64'],
    scannedAt: DateTime.parse(map['scanned_at']),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'content_base64': contentBase64,
    'scanned_at': scannedAt.toIso8601String(),
  };
}