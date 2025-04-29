import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qrscan/domain/repositories/pin_auth_repository.dart';
class SecureStorageService implements PinAuthRepository {
  final FlutterSecureStorage _storage;

  // Modified constructor to allow dependency injection for testing
  SecureStorageService({FlutterSecureStorage? storage}) 
      : _storage = storage ?? const FlutterSecureStorage();

  @override
  Future<void> savePin(String pin) async {
    await _storage.write(key: 'user_pin', value: pin);
  }

  @override
  Future<String?> getPin() async {
    return await _storage.read(key: 'user_pin');
  }
}