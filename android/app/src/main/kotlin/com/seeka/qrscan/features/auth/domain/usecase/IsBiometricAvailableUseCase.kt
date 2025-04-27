class IsBiometricAvailableUseCase(private val repository: AuthRepository) {
    suspend operator fun invoke() = repository.isBiometricAvailable()
}
