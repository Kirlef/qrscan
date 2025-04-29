import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:qrscan/domain/entities/scan_entity.dart';
import 'package:qrscan/domain/usecases/add_scan.dart';
import 'package:qrscan/domain/usecases/delete_scan.dart';
import 'package:qrscan/domain/usecases/get_scan.dart';
import 'package:qrscan/presentation/scan/bloc/scan_bloc.dart';
import 'package:qrscan/presentation/scan/bloc/scan_event.dart';
import 'package:qrscan/presentation/scan/bloc/scan_state.dart';
import 'package:mockito/annotations.dart';

import 'scan_bloc_test.mocks.dart';

// Generar mocks automáticamente para las dependencias
@GenerateMocks([AddScan, GetScans, DeleteScan])
void main() {
  late ScanBloc scanBloc;
  late MockAddScan mockAddScan;
  late MockGetScans mockGetScans;
  late MockDeleteScan mockDeleteScan;

  setUp(() {
    mockAddScan = MockAddScan();
    mockGetScans = MockGetScans();
    mockDeleteScan = MockDeleteScan();
    scanBloc = ScanBloc(
      addScan: mockAddScan,
      getScans: mockGetScans,
      deleteScan: mockDeleteScan,
    );
  });

  group('ScanBloc', () {
    test('emits ScanLoaded when LoadScans is added', () async {
      // Arrange
      final scanList = [ScanEntity(id: 1, contentBase64: 'test', scannedAt: DateTime.now())];
      when(mockGetScans()).thenAnswer((_) async => scanList);

      // Act
      scanBloc.add(LoadScans());

      // Assert
      await expectLater(
        scanBloc.stream,
        emitsInOrder([
          ScanLoading(),
          ScanLoaded(scanList),
        ]),
      );
    });

    test('emits ScanError when LoadScans fails', () async {
      // Arrange
      when(mockGetScans()).thenThrow(Exception('Failed to load scans'));

      // Act
      scanBloc.add(LoadScans());

      // Assert
      await expectLater(
        scanBloc.stream,
        emitsInOrder([
          ScanLoading(),
          ScanError(),
        ]),
      );
    });

    test('calls addScan when AddScanEvent is added', () async {
      // Arrange
      const qrContent = 'some_qr_content';
      final scan = ScanEntity(id: 1, contentBase64: qrContent, scannedAt: DateTime.now());
      when(mockAddScan(scan)).thenAnswer((_) async {});

      // Act
      scanBloc.add(AddScanEvent(qrContent));

      // Assert
      verify(mockAddScan(scan)).called(1);
    });

    test('calls deleteScan when DeleteScanEvent is added', () async {
      // Arrange
      const scanId = 1;
      when(mockDeleteScan(scanId)).thenAnswer((_) async {});

      // Act
      scanBloc.add(DeleteScanEvent(scanId));

      // Assert
      verify(mockDeleteScan(scanId)).called(1);
    });
  });
}
