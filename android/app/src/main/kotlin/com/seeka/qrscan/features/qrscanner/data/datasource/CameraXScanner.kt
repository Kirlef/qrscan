package com.seeka.qrscan.features.qrscanner.data.datasource

import android.annotation.SuppressLint
import androidx.camera.core.ExperimentalGetImage
import androidx.camera.core.ImageProxy
import com.google.mlkit.vision.barcode.BarcodeScanning
import com.google.mlkit.vision.barcode.common.Barcode
import com.google.mlkit.vision.common.InputImage
import com.seeka.qrscan.features.qrscanner.domain.model.QrCodeData
import com.seeka.qrscan.presentation.ui.QRCodeAnalyzer
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.SharedFlow

class CameraXScanner(  private val onQrScanned: (String) -> Unit,
private val onScanFailed: (Exception) -> Unit
) {
    private val _qrCodeFlow = MutableSharedFlow<QrCodeData>()
    val qrCodeFlow: SharedFlow<QrCodeData> get() = _qrCodeFlow

    fun onQrCodeScanned(data: String) {
        _qrCodeFlow.tryEmit(QrCodeData(data))
    }
    private val qrCodeAnalyzer = QRCodeAnalyzer(
        barcodeFormats = intArrayOf(Barcode.FORMAT_QR_CODE),
        onSuccess = { onQrScanned(it) },
        onFailure = { onScanFailed(it) }
    )

    @androidx.annotation.OptIn(ExperimentalGetImage::class)
    fun processImageProxy(imageProxy: ImageProxy) {
        qrCodeAnalyzer.analyze(imageProxy)
    }


}
