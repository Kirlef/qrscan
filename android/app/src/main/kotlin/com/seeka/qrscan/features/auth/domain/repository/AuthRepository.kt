interface AuthRepository {
    suspend fun isBiometricAvailable(): Boolean
    suspend fun authenticateUser(): Boolean
}