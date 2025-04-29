abstract class PinAuthRepository {
  Future<void> savePin(String pin);
  Future<String?> getPin();
}