import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qrscan/domain/entities/scan_entity.dart';
import 'package:qrscan/domain/usecases/add_scan.dart';
import 'package:qrscan/domain/usecases/delete_scan.dart';
import 'package:qrscan/domain/usecases/get_scan.dart';
import 'package:qrscan/presentation/scan/bloc/scan_bloc.dart';
import 'package:qrscan/presentation/scan/bloc/scan_event.dart';
import 'package:qrscan/presentation/scan/bloc/scan_state.dart';
class FakeScanEntity extends Fake implements ScanEntity {}
class MockAddScan extends Mock implements AddScan {}

class MockGetScans extends Mock implements GetScans {}

class MockDeleteScan extends Mock implements DeleteScan {}

void main() {
  late MockAddScan mockAddScan;
  late MockGetScans mockGetScans;
  late MockDeleteScan mockDeleteScan;
  late ScanBloc scanBloc;

  final mockScan = ScanEntity(
    id: 1,
    contentBase64: 'testContent',
    scannedAt: DateTime(2024, 1, 1),
  );

setUpAll(() {
    registerFallbackValue(FakeScanEntity());
  });

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

  group('LoadScans', () {
    blocTest<ScanBloc, ScanState>(
      'emits [ScanLoading, ScanLoaded] when successful',
      build: () {
        when(() => mockGetScans()).thenAnswer((_) async => [mockScan]);
        return scanBloc;
      },
      act: (bloc) => bloc.add(LoadScans()),
      expect: () => [
        isA<ScanLoading>(),
        isA<ScanLoaded>().having((s) => s.scans.length, 'scans.length', 1),
      ],
    );

    blocTest<ScanBloc, ScanState>(
      'emits [ScanLoading, ScanError] on exception',
      build: () {
        when(() => mockGetScans()).thenThrow(Exception());
        return scanBloc;
      },
      act: (bloc) => bloc.add(LoadScans()),
      expect: () => [
        isA<ScanLoading>(),
        isA<ScanError>(),
      ],
    );
  });

  group('AddScanEvent', () {
    blocTest<ScanBloc, ScanState>(
      'calls addScan and then emits [ScanLoading, ScanLoaded]',
      build: () {
        when(() => mockAddScan(any())).thenAnswer((_) async {});
        when(() => mockGetScans()).thenAnswer((_) async => [mockScan]);
        return scanBloc;
      },
      act: (bloc) => bloc.add(AddScanEvent('testContent')),
      expect: () => [
        isA<ScanLoading>(),
        isA<ScanLoaded>(),
      ],
      verify: (_) {
        verify(() => mockAddScan(any())).called(1);
      },
    );
  });

  group('DeleteScanEvent', () {
    blocTest<ScanBloc, ScanState>(
      'calls deleteScan and then emits [ScanLoading, ScanLoaded]',
      build: () {
        when(() => mockDeleteScan(1)).thenAnswer((_) async {});
        when(() => mockGetScans()).thenAnswer((_) async => []);
        return scanBloc;
      },
      act: (bloc) => bloc.add(DeleteScanEvent(1)),
      expect: () => [
        isA<ScanLoading>(),
        isA<ScanLoaded>().having((s) => s.scans.isEmpty, 'scans.isEmpty', true),
      ],
      verify: (_) {
        verify(() => mockDeleteScan(1)).called(1);
      },
    );
  });
}
