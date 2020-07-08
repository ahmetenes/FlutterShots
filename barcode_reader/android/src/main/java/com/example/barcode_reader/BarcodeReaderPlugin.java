package com.example.barcode_reader;

import android.app.Activity;
import android.content.Context;
import android.hardware.camera2.CameraAccessException;

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
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "barcode_reader");
    channel.setMethodCallHandler(this);
    this.flutterPluginBinding = flutterPluginBinding;
    this.context = flutterPluginBinding.getApplicationContext();
    this.textureRegistry = flutterPluginBinding.getTextureRegistry();
  }

  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "barcode_reader");
    channel.setMethodCallHandler(new BarcodeReaderPlugin());
  }


  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("openCamera")) {
      TakePicture(result);
    }
    if (call.method.equals("detectBarcode")) {
      Detect(result);
    }

  }

  private void TakePicture(Result result) {

    TextureRegistry.SurfaceTextureEntry flutterSurfaceTexture =
            textureRegistry.createSurfaceTexture();

    camera = new Camera(
            activity, flutterPluginBinding.getBinaryMessenger(), flutterSurfaceTexture, result
    );
    camera.openCamera();

  }

  private void Detect(Result result) {
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
