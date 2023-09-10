package com.aikaisys.workshop.qrcode

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity

import android.os.Bundle
import android.widget.Toast
import androidx.core.content.FileProvider
//import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(
            flutterEngine!!.getDartExecutor().getBinaryMessenger(),
            "cm.share/share"
        ).setMethodCallHandler { methodCall, result ->
            if (methodCall.method == "shareFile") {
//                Toast.makeText(applicationContext, "this is toast message", Toast.LENGTH_LONG)
//                    .show()
                shareFile(methodCall.arguments as String)
            }
        }
    }

    private fun shareFile(path: String) {
        val imageFile = File(cacheDir, path)
        val contentUri = FileProvider.getUriForFile(this, "cm.qrcode.share", imageFile)
        // cm.qrcode.share (ref. AndriodManifest.xml)

        Intent(Intent.ACTION_SEND).let {
            it.type = "image/png"
            it.putExtra(Intent.EXTRA_STREAM, contentUri)
            startActivity(Intent.createChooser(it, "Share QRCode")) // not work?
        }
    }
}
