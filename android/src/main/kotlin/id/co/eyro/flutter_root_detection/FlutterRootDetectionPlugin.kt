package id.co.eyro.flutter_root_detection

import android.content.Context
import android.os.Build
import android.provider.Settings
import androidx.annotation.NonNull
import com.scottyab.rootbeer.RootBeer

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterRootDetectionPlugin */
class FlutterRootDetectionPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private lateinit var context : Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_root_detection")
    channel.setMethodCallHandler(this)

    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "rooted") {
      val rootBeer = RootBeer(context)
      result.success(rootBeer.isRooted)
      return
    }

    if (call.method == "developerMode"){
      result.success(isDevMode())
      return
    }

    result.notImplemented()
  }

  private fun isDevMode(): Boolean {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
      return Settings.Secure.getInt(context.contentResolver,
              Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0) != 0
    }

    return false
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
