package com.aikaisys.workshop.qrcode

import io.flutter.embedding.android.FlutterActivity

import android.os.Bundle
import android.widget.Toast

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        Toast.makeText(applicationContext,"this is toast message",Toast.LENGTH_LONG).show()
    }
}
