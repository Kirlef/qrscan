package com.seeka.qrscan.features.qrscanner.data.repository

import com.seeka.qrscan.ScanQrFlutterApi

class QrScannerFlutterApiImpl {
}
class ScanQrFlutterApiImpl(private val flutterApi: ScanQrFlutterApi) {
    fun sendSuccess(qrData: String) {
        flutterApi.onScanSuccess(qrData) { }
    }

    fun sendError(message: String) {
        flutterApi.onScanError(message) { /* manejo de callback si quieres */ }
    }
}