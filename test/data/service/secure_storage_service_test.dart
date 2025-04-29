import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qrscan/data/service/secure_storage_service.dart';

// Generate mock for FlutterSecureStorage
@GenerateMocks([FlutterSecureStorage])
import 'secure_storage_service_test.mocks.dart';

void main() {
  late MockFlutterSecureStorage mockStorage;
  late SecureStorageService secureStorageService;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    secureStorageService = SecureStorageService(storage: mockStorage);
  });

  group('SecureStorageService', () {
    const testPin = '1234';
    const storageKey = 'user_pin';

    group('savePin', () {
      test('calls FlutterSecureStorage.write with correct parameters', () async {
        // Arrange
        when(mockStorage.write(key: storageKey, value: testPin))
            .thenAnswer((_) async => null);

        // Act
        await secureStorageService.savePin(testPin);

        // Assert
        verify(mockStorage.write(key: storageKey, value: testPin)).called(1);
      });

      test('handles exceptions from FlutterSecureStorage.write', () async {
        // Arrange
        when(mockStorage.write(key: storageKey, value: testPin))
            .thenThrow(Exception('Storage error'));

        // Act & Assert
        expect(() => secureStorageService.savePin(testPin), throwsException);
      });
    });

    group('getPin', () {
      test('returns pin when it exists in storage', () async {
        // Arrange
        when(mockStorage.read(key: storageKey)).thenAnswer((_) async => testPin);

        // Act
        final result = await secureStorageService.getPin();

        // Assert
        expect(result, equals(testPin));
        verify(mockStorage.read(key: storageKey)).called(1);
      });

      test('returns null when pin does not exist in storage', () async {
        // Arrange
        when(mockStorage.read(key: storageKey)).thenAnswer((_) async => null);

        // Act
        final result = await secureStorageService.getPin();

        // Assert
        expect(result, isNull);
        verify(mockStorage.read(key: storageKey)).called(1);
      });

      test('handles exceptions from FlutterSecureStorage.read', () async {
        // Arrange
        when(mockStorage.read(key: storageKey))
            .thenThrow(Exception('Storage read error'));

        // Act & Assert
        expect(() => secureStorageService.getPin(), throwsException);
      });
    });
  
  });
}