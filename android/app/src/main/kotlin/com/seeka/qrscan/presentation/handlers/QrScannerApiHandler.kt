package com.seeka.qrscan.presentation.handlers

import com.seeka.qrscan.features.qrscanner.domain.usecase.ScanQrCodeUseCase
import com.seeka.qrscan.GeneratedPigeon
import kotlinx.coroutines.flow.first
import kotlinx.coroutines.runBlocking

class QrScannerApiHandler(
    private val scanQrCodeUseCase: ScanQrCodeUseCase
) : GeneratedPigeon.QrScannerApi {

    override fun scanQr(): String {
        return runBlocking {
            scanQrCodeUseCase().first().content
        }
    }
}
