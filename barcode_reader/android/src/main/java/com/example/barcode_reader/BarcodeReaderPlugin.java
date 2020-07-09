package com.example.barcode_reader;

import android.app.Activity;
import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.view.TextureRegistry;

/**
 * BarcodeReaderPlugin
 */
public class BarcodeReaderPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  private FlutterPluginBinding flutterPluginBinding;
  private Context context;
  private Activity activity;
  private MethodChannel channel;
  private TextureRegistry textureRegistry;
  private Camera camera;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "Reader");
    channel.setMethodCallHandler(this);
    this.flutterPluginBinding = flutterPluginBinding;
    this.context = flutterPluginBinding.getApplicationContext();


  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "Reader");
    channel.setMethodCallHandler(new BarcodeReaderPlugin());
  }


  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("openCamera")) {

      cameraPreview(result);
    }
    if (call.method.equals("detectBarcode")) {
      detect(result);
    }

  }

  private void cameraPreview(Result result) {

    TextureRegistry.SurfaceTextureEntry flutterSurfaceTexture =
            textureRegistry.createSurfaceTexture();

    camera = new Camera(
            activity, flutterPluginBinding.getBinaryMessenger(), flutterSurfaceTexture, result
    );
    camera.openCamera();

  }

  private void detect(Result result) {
    camera.detect();
    result.success("Detect");

  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
    this.textureRegistry = flutterPluginBinding.getTextureRegistry();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {

  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {

  }

  @Override
  public void onDetachedFromActivity() {

  }
}
