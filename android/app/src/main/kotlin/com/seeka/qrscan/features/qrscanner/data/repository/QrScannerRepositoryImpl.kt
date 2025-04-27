package com.seeka.qrscan.features.qrscanner.data.repository

import com.seeka.qrscan.features.qrscanner.data.datasource.CameraXScanner
import com.seeka.qrscan.features.qrscanner.domain.model.QrCodeData
import com.seeka.qrscan.features.qrscanner.domain.repository.QrScannerRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.map

class QrScannerRepositoryImpl(
    private val cameraXScanner: CameraXScanner
) : QrScannerRepository {

    override fun scanQrCode(): Flow<QrCodeData> {
        return cameraXScanner.qrCodeFlow.map { QrCodeData(it) }
    }
}