package com.seeka.qrscan.core.platformviews

import android.content.Context
import android.view.View
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.Preview
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.camera.view.PreviewView
import androidx.core.content.ContextCompat
import androidx.lifecycle.LifecycleOwner
import com.seeka.qrscan.features.qrscanner.data.datasource.CameraXScanner
import io.flutter.plugin.platform.PlatformView

class CameraPreview(
    private val context: Context,
    private val cameraXScanner: CameraXScanner
) : PlatformView {

    private val previewView: PreviewView = PreviewView(context)

    init {
        startCamera()
    }

    private fun startCamera() {
        val cameraProviderFuture = ProcessCameraProvider.getInstance(context)
        cameraProviderFuture.addListener({
            val cameraProvider = cameraProviderFuture.get()

            val preview = Preview.Builder().build().also {
                it.setSurfaceProvider(previewView.surfaceProvider)
            }

            val imageAnalysis = ImageAnalysis.Builder()
                .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                .build()

            imageAnalysis.setAnalyzer(
                ContextCompat.getMainExecutor(context),
                { imageProxy -> cameraXScanner.processImageProxy(imageProxy) }
            )

            val cameraSelector = CameraSelector.DEFAULT_BACK_CAMERA

            cameraProvider.unbindAll()
            cameraProvider.bindToLifecycle(
                context as LifecycleOwner,
                cameraSelector,
                preview,
                imageAnalysis
            )
        }, ContextCompat.getMainExecutor(context))
    }

    override fun getView(): View {
        return previewView
    }

    override fun dispose() {}
}
