import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qrscan/domain/entities/scan_entity.dart';
import 'package:qrscan/domain/repositories/scan_repository.dart';
import 'package:qrscan/domain/usecases/add_scan.dart';


@GenerateMocks([ScanRepository])
import 'add_scan_test.mocks.dart';
void main() {
  late MockScanRepository mockRepository;
  late AddScan addScan;

  setUp(() {
    mockRepository = MockScanRepository();
    addScan = AddScan(mockRepository);
  });

  test('should call repository.addScan with correct ScanEntity', () async {
    // Arrange
    final scan = ScanEntity(
      id: 1,
      contentBase64: 'test_base64',
      scannedAt: DateTime(2025, 4, 28),
    );

    when(mockRepository.addScan(scan)).thenAnswer((_) async => {});

    // Act
    await addScan(scan);

    // Assert
    verify(mockRepository.addScan(scan)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
