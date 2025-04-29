package com.seeka.qrscan.presentation.ui

import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import android.util.Size
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.camera.core.*
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.google.mlkit.vision.barcode.common.Barcode
import com.seeka.qrscan.databinding.ActivityQrScannerBinding
import com.seeka.qrscan.presentation.infrastructure.QrScanFlutterBridge
import java.util.concurrent.Executors

class QrScannerActivity : AppCompatActivity() {

    private lateinit var binding: ActivityQrScannerBinding
    private val executor = Executors.newSingleThreadExecutor()

    private var hasScanned = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityQrScannerBinding.inflate(layoutInflater)
        setContentView(binding.root)

        if (ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED) {
            startCamera()
        } else {
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.CAMERA), 1001)
        }
    }

    private fun startCamera() {
        val cameraProviderFuture = ProcessCameraProvider.getInstance(this)

        cameraProviderFuture.addListener({
            val cameraProvider = cameraProviderFuture.get()

            val preview = Preview.Builder()
                .build()
                .apply {
                    setSurfaceProvider(binding.previewView.surfaceProvider)
                }

            val imageAnalysis = ImageAnalysis.Builder()
                .setTargetResolution(Size(1280, 720))
                .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                .build()
                .apply {
                    setAnalyzer(executor, QRCodeAnalyzer(
                        barcodeFormats = intArrayOf(Barcode.FORMAT_QR_CODE), // 👈 solo QR Code
                        onSuccess = { qrText ->
                            if (!hasScanned) {
                                hasScanned = true
                                sendResultToFlutter(qrText)
                            }
                        },
                        onFailure = { exception ->
                            Toast.makeText(this@QrScannerActivity, "Error escaneando QR: ${exception.message}", Toast.LENGTH_SHORT).show()
                        }
                    ))
                }

            cameraProvider.unbindAll()
            cameraProvider.bindToLifecycle(this, CameraSelector.DEFAULT_BACK_CAMERA, preview, imageAnalysis)

        }, ContextCompat.getMainExecutor(this))
    }

    private fun sendResultToFlutter(qrText: String) {
        QrScanFlutterBridge.flutterApi?.onScanSuccess(qrText) {
            finish()
        }
    }

    override fun onDestroy() {
        executor.shutdown()
        super.onDestroy()
    }
}