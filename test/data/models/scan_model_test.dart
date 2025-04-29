import 'package:flutter_test/flutter_test.dart';
import 'package:qrscan/data/models/scan_model.dart'; // Asegúrate de que la ruta sea correcta
import 'package:qrscan/domain/entities/scan_entity.dart';

void main() {
  group('ScanModel Tests', () {
    // Test para la creación del modelo desde un Map
    test('Debería crear un ScanModel desde un Map', () {
      // Simulamos un Map como si viniera de la base de datos o una API
      final map = {
        'id': 1,
        'content_base64': 'testBase64Content',
        'scanned_at': '2025-04-28T12:00:00.000Z',
      };

      final scanModel = ScanModel.fromMap(map);

      // Verificamos que el modelo se creó correctamente desde el Map
      expect(scanModel.id, 1);
      expect(scanModel.contentBase64, 'testBase64Content');
      expect(scanModel.scannedAt, DateTime.parse('2025-04-28T12:00:00.000Z'));
    });

    // Test para la conversión del ScanModel a un Map
    test('Debería convertir un ScanModel a Map', () {
      final scanModel = ScanModel(
        id: 1,
        contentBase64: 'testBase64Content',
        scannedAt: DateTime.parse('2025-04-28T12:00:00.000Z'),
      );

      final map = scanModel.toMap();

      // Verificamos que el Map generado tiene los valores correctos
      expect(map['id'], 1);
      expect(map['content_base64'], 'testBase64Content');
      expect(map['scanned_at'], '2025-04-28T12:00:00.000Z');
    });

    // Test de igualdad con ScanEntity (si necesitas comparar propiedades)
    test('Debería ser una instancia de ScanEntity', () {
      final scanModel = ScanModel(
        id: 1,
        contentBase64: 'testBase64Content',
        scannedAt: DateTime.parse('2025-04-28T12:00:00.000Z'),
      );

      // Verificamos que la instancia sea del tipo ScanEntity
      expect(scanModel, isA<ScanEntity>());
    });
  });
}
