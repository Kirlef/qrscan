package com.seeka.qrscan.features.qrscanner.domain.usecase

import com.seeka.qrscan.features.qrscanner.domain.repository.QrScannerRepository
import kotlinx.coroutines.flow.Flow
import com.seeka.qrscan.features.qrscanner.domain.model.QrCodeData

class ScanQrCodeUseCase(
    private val repository: QrScannerRepository
) {
    operator fun invoke(): Flow<QrCodeData> {
        return repository.scanQrCode()
    }
}
