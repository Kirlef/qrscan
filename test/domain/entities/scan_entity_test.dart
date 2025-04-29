import 'package:flutter_test/flutter_test.dart';
import 'package:qrscan/domain/entities/scan_entity.dart';

void main() {
  group('ScanEntity', () {
    test('should store values correctly', () {
      // Arrange
      final id = 1;
      final content = 'dGVzdA=='; // base64 for 'test'
      final date = DateTime.parse('2024-01-01T12:00:00Z');

      // Act
      final scan = ScanEntity(
        id: id,
        contentBase64: content,
        scannedAt: date,
      );

      // Assert
      expect(scan.id, id);
      expect(scan.contentBase64, content);
      expect(scan.scannedAt, date);
    });
  });
}
