package com.example.barcode_reader;

import android.app.Activity;
import android.app.Service;
import android.content.Context;
import android.graphics.ImageFormat;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CameraMetadata;
import android.hardware.camera2.CaptureRequest;
import android.media.ImageReader;
import android.view.Surface;

import androidx.annotation.NonNull;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.TextureRegistry;

public class Camera {
    private final MethodChannel.Result result;
    private final BinaryMessenger binaryMessenger;
    private TextureRegistry.SurfaceTextureEntry surfaceTextureEntry;
    private CameraManager cameraManager;
    private CaptureRequest.Builder captureRequestBuilder;
    private CameraDevice cameraDevice;
    private Context context;

    public Camera(Activity activity, BinaryMessenger binaryMessenger, TextureRegistry.SurfaceTextureEntry flutterSurfaceTexture, MethodChannel.Result result) {
        this.cameraManager = (CameraManager) activity.getSystemService(Service.CAMERA_SERVICE);
        this.context = activity.getApplicationContext();
        this.surfaceTextureEntry = flutterSurfaceTexture;
        this.result = result;
        this.binaryMessenger = binaryMessenger;
    }

    private String[] getAvailableCameras() {
        try {
            return cameraManager.getCameraIdList();
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
        return new String[0];
    }

    public void openCamera() {
        //TODO: Camera Permission Requests [checkPermissions]  will be added here.
        //checkPermissions();

        String[] availableCameras = getAvailableCameras();
        if (availableCameras.length <= 0) {
            return;
        }
        ImageReader pictureImageReader = ImageReader.newInstance(1080, 720, ImageFormat.JPEG, 2);
        CameraDevice.StateCallback stateCallback = new CameraStateCallback(pictureImageReader, result);
        try {
            cameraManager.openCamera(availableCameras[0], stateCallback, null);
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }
    }

    private void checkPermissions() {
        //TODO: Permission Check Will be implemented.
    }

    private void startPreview(MethodChannel.Result result, Surface... incomingSurfaces) throws CameraAccessException {
        captureRequestBuilder = cameraDevice.createCaptureRequest(CameraDevice.TEMPLATE_PREVIEW);
        SurfaceTexture surfaceTexture = surfaceTextureEntry.surfaceTexture();
        surfaceTexture.setDefaultBufferSize(800, 600);
        Surface imageSurface = new Surface(surfaceTexture);

        captureRequestBuilder.addTarget(imageSurface);
        List<Surface> incomingSurfaceList = Arrays.asList(incomingSurfaces);
        CameraCaptureSession.StateCallback callback = new CaptureSessionCallback(surfaceTextureEntry, null, result);
        List<Surface> surfaceList = new ArrayList<>();
        surfaceList.add(imageSurface);
        surfaceList.addAll(incomingSurfaceList);
        cameraDevice.createCaptureSession(surfaceList, callback, null);

    }

    public void detect() {
        //TODO: Here will be the barcode detection
    }

    private class CaptureSessionCallback extends CameraCaptureSession.StateCallback {
        private TextureRegistry.SurfaceTextureEntry surfaceTextureEntry;
        private MethodChannel.Result result;
        private Runnable onSuccessCallback;

        public CaptureSessionCallback(TextureRegistry.SurfaceTextureEntry _surfaceTextureEntry, final Runnable onSuccessCallback, MethodChannel.Result _result) {
            this.surfaceTextureEntry = _surfaceTextureEntry;
            this.result = _result;
            this.onSuccessCallback = onSuccessCallback;
        }

        @Override
        public void onConfigured(@NonNull CameraCaptureSession _cameraCaptureSession) {
            captureRequestBuilder.set(
                    CaptureRequest.CONTROL_MODE, CameraMetadata.CONTROL_MODE_AUTO);
            captureRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, CaptureRequest.CONTROL_AF_MODE_AUTO);
            try {
                _cameraCaptureSession.setRepeatingRequest(captureRequestBuilder.build(), null, null);
            } catch (CameraAccessException e) {
                e.printStackTrace();
            }
//            if (onSuccessCallback != null) {
//                onSuccessCallback.run();
//            }
            Map<String, Long> reply = new HashMap<>();
            reply.put("texture_id", this.surfaceTextureEntry.id());
            System.out.println(reply.get("texture_id"));
            result.success(reply);


        }

        @Override
        public void onConfigureFailed(@NonNull CameraCaptureSession cameraCaptureSession) {

        }
    }


    private class CameraStateCallback extends CameraDevice.StateCallback {
        private ImageReader pictureImageReader;
        private MethodChannel.Result result;

        public CameraStateCallback(ImageReader _pictureImageReader, MethodChannel.Result _result) {
            this.pictureImageReader = _pictureImageReader;
            this.result = _result;
        }

        @Override
        public void onOpened(@NonNull CameraDevice _cameraDevice) {
            cameraDevice = _cameraDevice;
            try {
                startPreview(result, pictureImageReader.getSurface());
            } catch (CameraAccessException e) {
                e.printStackTrace();
            }
        }

        @Override
        public void onDisconnected(@NonNull CameraDevice cameraDevice) {

        }

        @Override
        public void onError(@NonNull CameraDevice cameraDevice, int i) {

        }
    }


}
