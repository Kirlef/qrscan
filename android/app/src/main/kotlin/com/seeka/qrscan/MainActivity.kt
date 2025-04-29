package com.seeka.qrscan

import android.app.Activity
import android.content.Intent
import android.hardware.biometrics.BiometricManager
import android.hardware.biometrics.BiometricPrompt
import android.os.Bundle
import android.widget.Toast
import androidx.core.content.ContextCompat
import com.seeka.qrscan.features.qrscanner.data.repository.QrScannerFlutterApiImpl
import com.seeka.qrscan.features.qrscanner.data.repository.ScanQrHostApiImpl
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
//import com.seeka.qrscan.presentation.infrastructure.DependencyInjector
import com.seeka.qrscan.presentation.ui.QrScannerActivity
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.Executor

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.seeka.qr/scan"
    private lateinit var scanQrFlutterApi: ScanQrFlutterApi

    private lateinit var executor: Executor

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)


        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "startQrScan") {

            }
        }


    }
  

    interface FlutterEngineProvider {
        fun getFlutterEngine(): FlutterEngine
    }


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        scanQrFlutterApi = ScanQrFlutterApi(flutterEngine.dartExecutor.binaryMessenger)

        QrScannerApi.setUp(flutterEngine.dartExecutor.binaryMessenger, ScanQrHostApiImpl(this, scanQrFlutterApi))

    }
    private var resultCallback: MethodChannel.Result? = null

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 101 && resultCode == Activity.RESULT_OK) {
            val qrResult = data?.getStringExtra("qr_result")
            resultCallback?.success(qrResult)
        } else {
            resultCallback?.error("CANCELLED", "User cancelled", null)
        }
    }
}