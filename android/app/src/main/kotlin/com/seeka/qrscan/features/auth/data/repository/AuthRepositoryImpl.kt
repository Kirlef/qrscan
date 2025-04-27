import android.app.Activity
import android.content.Context
import androidx.biometric.BiometricManager
import androidx.biometric.BiometricPrompt
import androidx.core.content.ContextCompat
import androidx.fragment.app.FragmentActivity
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlin.coroutines.resume

class AuthRepositoryImpl(
    private val context: Context,
    private val activity: Activity
) : AuthRepository {

    override suspend fun isBiometricAvailable(): Boolean {
        val biometricManager = BiometricManager.from(context)
        return biometricManager.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_WEAK) ==
               BiometricManager.BIOMETRIC_SUCCESS
    }

    override suspend fun authenticateUser(): Boolean {
        // Aquí implementas BiometricPrompt en modo seguro con Flow
        return suspendCancellableCoroutine { cont ->
            val executor = ContextCompat.getMainExecutor(context)
            val biometricPrompt = BiometricPrompt(
                activity as FragmentActivity,
                executor,
                object : BiometricPrompt.AuthenticationCallback() {
                    override fun onAuthenticationSucceeded(result: BiometricPrompt.AuthenticationResult) {
                        cont.resume(true)
                    }

                    override fun onAuthenticationFailed() {
                        cont.resume(false)
                    }

                    override fun onAuthenticationError(errorCode: Int, errString: CharSequence) {
                        cont.resume(false)
                    }
                })

            val promptInfo = BiometricPrompt.PromptInfo.Builder()
                .setTitle("Autenticación Biométrica")
                .setSubtitle("Use su huella o rostro")
                .setNegativeButtonText("Cancelar")
                .build()

            biometricPrompt.authenticate(promptInfo)
        }
    }
}
