package com.seeka.qrscan

import androidx.annotation.NonNull
import com.seeka.qrscan.core.platformviews.CameraPreviewFactory
import com.seeka.qrscan.features.qrscanner.data.datasource.CameraXScanner
import com.seeka.qrscan.presentation.handlers.AuthApiHandler
import com.seeka.qrscan.presentation.handlers.QrScannerApiHandler
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.seeka.qrscan.GeneratedPigeon

class MainActivity: FlutterActivity(){
    
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        val cameraXScanner = CameraXScanner()

        GeneratedPigeon.AuthApi.setup(
            flutterEngine.dartExecutor.binaryMessenger,
            AuthApiHandler(authenticateUserUseCase, isBiometricAvailableUseCase)
        )

        GeneratedPigeon.QrScannerApi.setup(
            flutterEngine.dartExecutor.binaryMessenger,
            QrScannerApiHandler(scanQrCodeUseCase)
        )

         flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(
                "camera_preview",
                CameraPreviewFactory(cameraXScanner)
            )
    } 
}
