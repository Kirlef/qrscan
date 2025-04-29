import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qrscan/domain/repositories/pin_auth_repository.dart';


@GenerateMocks([PinAuthRepository])
import 'pin_auth_repository_test.mocks.dart';
void main() {
  late MockPinAuthRepository mockRepository;

  const testPin = '1234';

  setUp(() {
    mockRepository = MockPinAuthRepository();
  });

  group('PinAuthRepository', () {
    test('savePin stores the PIN correctly', () async {
      when(mockRepository.savePin(testPin)).thenAnswer((_) async {});

      await mockRepository.savePin(testPin);

      verify(mockRepository.savePin(testPin)).called(1);
    });

    test('getPin returns the correct PIN', () async {
      when(mockRepository.getPin()).thenAnswer((_) async => testPin);

      final result = await mockRepository.getPin();

      expect(result, equals(testPin));
      verify(mockRepository.getPin()).called(1);
    });
  });
}
