import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:qrscan/domain/entities/scan_entity.dart';
import 'package:qrscan/domain/repositories/scan_repository.dart';

@GenerateMocks([ScanRepository])
import 'scan_repository_test.mocks.dart';

void main() {
  late MockScanRepository mockRepository;

  setUp(() {
    mockRepository = MockScanRepository();
  });

  final testScan = ScanEntity(
    id: 1,
    contentBase64: 'test_content',
    scannedAt: DateTime(2025, 4, 28),
  );

  group('ScanRepository', () {
    test('addScan is called with correct ScanEntity', () async {
      when(mockRepository.addScan(any)).thenAnswer((_) async {});

      await mockRepository.addScan(testScan);

      verify(mockRepository.addScan(testScan)).called(1);
    });

    test('getScans returns expected list', () async {
      when(mockRepository.getScans()).thenAnswer((_) async => [testScan]);

      final result = await mockRepository.getScans();

      expect(result, isA<List<ScanEntity>>());
      expect(result.length, 1);
      expect(result.first.id, 1);
    });

    test('deleteScan is called with correct ID', () async {
      when(mockRepository.deleteScan(1)).thenAnswer((_) async {});

      await mockRepository.deleteScan(1);

      verify(mockRepository.deleteScan(1)).called(1);
    });
  });
}
