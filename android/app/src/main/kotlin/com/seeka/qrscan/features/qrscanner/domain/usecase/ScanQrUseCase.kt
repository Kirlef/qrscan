package com.seeka.qrscan.features.qrscanner.domain.usecase

import com.seeka.qrscan.features.qrscanner.domain.repository.QrScannerRepository
import kotlinx.coroutines.flow.first


class ScanQrCodeUseCase(
    private val repository: QrScannerRepository
) {
    suspend operator fun invoke(cameraXScanner: com.seeka.qrscan.features.qrscanner.data.datasource.CameraXScanner): String {
        val qrCodeData = repository.scanQrCode() // Obtener el Flow
        return qrCodeData.first().content//..firstOrNull()?.data ?: "" // Obtener el primer valor o vacío
    }
}
