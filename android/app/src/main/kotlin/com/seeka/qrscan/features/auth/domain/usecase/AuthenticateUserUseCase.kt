
class AuthenticateUserUseCase(private val repository: AuthRepository) {
    suspend operator fun invoke() = repository.authenticateUser()
}
