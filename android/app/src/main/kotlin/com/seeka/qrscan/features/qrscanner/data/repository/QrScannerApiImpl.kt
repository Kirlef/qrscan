package com.seeka.qrscan.features.qrscanner.data.repository

import android.app.Activity
import android.content.Context
import android.content.Intent
import androidx.core.app.ActivityCompat.startActivityForResult
import com.seeka.qrscan.QrScannerApi
import com.seeka.qrscan.ScanQrFlutterApi
import com.seeka.qrscan.presentation.ui.QrScannerActivity

class ScanQrHostApiImpl(
    private val activity: Activity,
    private val flutterApi: ScanQrFlutterApi
) : QrScannerApi {

    override fun scanQr(callback: (Result<String>) -> Unit) {
        val context = activity.applicationContext
        val intent = Intent(context, QrScannerActivity::class.java)
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_NEW_TASK)
        context.startActivity(intent)
        //startActivityForResult(activity,101)
        //resultCallback = result // Store to return result later
    }
}

