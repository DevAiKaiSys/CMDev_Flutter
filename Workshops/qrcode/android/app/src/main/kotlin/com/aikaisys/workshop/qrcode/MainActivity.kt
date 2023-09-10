package com.aikaisys.workshop.qrcode

import io.flutter.embedding.android.FlutterActivity

import android.os.Bundle
import android.widget.Toast
//import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(
            flutterEngine!!.getDartExecutor().getBinaryMessenger(),
            "cm.share/share"
        ).setMethodCallHandler { methodCall, result ->
            if (methodCall.method == "shareFile") {
                Toast.makeText(applicationContext, "this is toast message", Toast.LENGTH_LONG)
                    .show()
            }
        }
    }
}
