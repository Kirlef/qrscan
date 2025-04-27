package com.seeka.qrscan.features.qrscanner.data.datasource

import android.annotation.SuppressLint
import androidx.camera.core.ImageProxy
import com.google.mlkit.vision.barcode.BarcodeScanning
import com.google.mlkit.vision.common.InputImage
import kotlinx.coroutines.flow.MutableSharedFlow

class CameraXScanner {

    val qrCodeFlow = MutableSharedFlow<String>(extraBufferCapacity = 1)

    @SuppressLint("UnsafeOptInUsageError")
    fun processImageProxy(imageProxy: ImageProxy) {
        val mediaImage = imageProxy.image
        if (mediaImage != null) {
            val image = InputImage.fromMediaImage(mediaImage, imageProxy.imageInfo.rotationDegrees)
            val scanner = BarcodeScanning.getClient()

            scanner.process(image)
                .addOnSuccessListener { barcodes ->
                    for (barcode in barcodes) {
                        barcode.rawValue?.let { value ->
                            qrCodeFlow.tryEmit(value)
                        }
                    }
                }
                .addOnFailureListener { }
                .addOnCompleteListener {
                    imageProxy.close()
                }
        } else {
            imageProxy.close()
        }
    }
}
