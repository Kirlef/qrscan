import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:qrscan/data/datasource/scan_dao.dart';
import 'package:qrscan/data/models/scan_model.dart';
import 'package:qrscan/data/repositories/scan_repository_impl.dart';
import 'package:qrscan/domain/entities/scan_entity.dart';

import 'scan_repository_impl_test.mocks.dart';

@GenerateMocks([ScanDao])
void main() {
  late ScanRepositoryImpl repository;
  late MockScanDao mockScanDao;

  setUp(() {
    mockScanDao = MockScanDao();
    repository = ScanRepositoryImpl(mockScanDao);
  });

  group('ScanRepositoryImpl', () {
    final testScanEntity = ScanEntity(
      id: 1,
      contentBase64: 'test_content',
      scannedAt: DateTime(2025, 4, 28),
    );

    final testScanModel = ScanModel(
      id: 1,
      contentBase64: 'test_content',
      scannedAt: DateTime(2025, 4, 28),
    );

    test('addScan should call insertScan on DAO with correct model', () async {
      // Arrange
      when(mockScanDao.insertScan(any)).thenAnswer((_) async {});

      // Act
      await repository.addScan(testScanEntity);

      // Assert - Verificamos que se llamó con un modelo que tiene las mismas propiedades
      verify(mockScanDao.insertScan(argThat(
        predicate<ScanModel>((model) =>
        model.id == testScanEntity.id &&
            model.contentBase64 == testScanEntity.contentBase64 &&
            model.scannedAt == testScanEntity.scannedAt),
      ))).called(1);
    });

    test('getScans should return what DAO returns', () async {
      // Arrange
      final List<ScanModel> scansList = [testScanModel];
      when(mockScanDao.getScans()).thenAnswer((_) async => scansList);

      // Act
      final result = await repository.getScans();

      // Assert
      expect(result, scansList);
      verify(mockScanDao.getScans()).called(1);
    });

    test('deleteScan should call deleteScan on DAO with correct id', () async {
      // Arrange
      const testId = 1;
      when(mockScanDao.deleteScan(any)).thenAnswer((_) async {});

      // Act
      await repository.deleteScan(testId);

      // Assert
      verify(mockScanDao.deleteScan(testId)).called(1);
    });
  });
}