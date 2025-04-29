import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qrscan/domain/entities/scan_entity.dart';
import 'package:qrscan/domain/repositories/scan_repository.dart';
import 'package:qrscan/domain/usecases/get_scan.dart';

@GenerateMocks([ScanRepository])
import 'get_scan_test.mocks.dart';
void main() {
  late MockScanRepository mockRepository;
  late GetScans getScans;

  setUp(() {
    mockRepository = MockScanRepository();
    getScans = GetScans(mockRepository);
  });

  test('should return list of scans from repository', () async {
    // Arrange
    final scans = [
      ScanEntity(id: 1, contentBase64: 'abc', scannedAt: DateTime(2025, 4, 28)),
      ScanEntity(id: 2, contentBase64: 'def', scannedAt: DateTime(2025, 4, 27)),
    ];

    when(mockRepository.getScans()).thenAnswer((_) async => scans);

    // Act
    final result = await getScans();

    // Assert
    expect(result, scans);
    verify(mockRepository.getScans()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
