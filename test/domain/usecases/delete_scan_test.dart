import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qrscan/domain/repositories/scan_repository.dart';
import 'package:qrscan/domain/usecases/delete_scan.dart';


@GenerateMocks([ScanRepository])
import 'delete_scan_test.mocks.dart';
void main() {
  late MockScanRepository mockRepository;
  late DeleteScan deleteScan;

  setUp(() {
    mockRepository = MockScanRepository();
    deleteScan = DeleteScan(mockRepository);
  });

  test('should call repository.deleteScan with correct id', () async {
    // Arrange
    const int testId = 42;
    when(mockRepository.deleteScan(testId)).thenAnswer((_) async {});

    // Act
    await deleteScan(testId);

    // Assert
    verify(mockRepository.deleteScan(testId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
