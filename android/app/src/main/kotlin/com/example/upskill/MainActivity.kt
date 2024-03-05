package com.example.flutter_training

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private final val channelName = "flutter_training";

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channelName
        ).setMethodCallHandler { call, _ ->
            if (call.method == "showToast") {
                Toast.makeText(this, "Hello world from android", Toast.LENGTH_SHORT).show()
            }
        }

        super.configureFlutterEngine(flutterEngine)
    }
}
