package com.seeka.qrscan.features.qrscanner.domain.repository

import kotlinx.coroutines.flow.Flow
import com.seeka.qrscan.features.qrscanner.domain.model.QrCodeData

interface QrScannerRepository {
    fun scanQrCode(): Flow<QrCodeData>
}