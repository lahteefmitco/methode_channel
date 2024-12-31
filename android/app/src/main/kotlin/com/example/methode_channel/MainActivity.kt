package com.example.methode_channel



import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){
    private val CHANNEL = "com.example/my_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->

            if (call.method == "getPlatformData") {

                val arguments = call.arguments as? Map<*,*>
                val data = arguments?.get("data") as String?
                if(data != null) {
                    Toast.makeText(this, "Received data $data", Toast.LENGTH_LONG).show()
                    val platformData = "Toast message has shown"
                    result.success(platformData)
                }else{
                    result.error("400","No data","dsd")
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
