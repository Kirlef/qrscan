package com.seeka.qrscan.presentation.handlers

import AuthenticateUserUseCase
import IsBiometricAvailableUseCase
import com.seeka.qrscan.GeneratedPigeon
import kotlinx.coroutines.runBlocking

class AuthApiHandler(
    private val authenticateUserUseCase: AuthenticateUserUseCase,
    private val isBiometricAvailableUseCase: IsBiometricAvailableUseCase
) : GeneratedPigeon.AuthApi {

    override fun isBiometricAvailable(): Boolean {
        return runBlocking { isBiometricAvailableUseCase() }
    }

    override fun authenticate(): Boolean {
        return runBlocking { authenticateUserUseCase() }
    }
}
