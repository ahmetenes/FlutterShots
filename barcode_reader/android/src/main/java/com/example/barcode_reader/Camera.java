package com.example.barcode_reader;

import android.app.Activity;
import android.app.Service;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.ImageFormat;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CameraMetadata;
import android.hardware.camera2.CaptureRequest;
import android.media.Image;
import android.media.ImageReader;
import android.view.Surface;

import androidx.annotation.NonNull;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.mlkit.vision.barcode.Barcode;
import com.google.mlkit.vision.barcode.BarcodeScanner;
import com.google.mlkit.vision.barcode.BarcodeScannerOptions;
import com.google.mlkit.vision.barcode.BarcodeScanning;
import com.google.mlkit.vision.common.InputImage;

import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.TextureRegistry;

public class Camera {
    private final MethodChannel.Result result;
    private TextureRegistry.SurfaceTextureEntry surfaceTextureEntry;
    private CameraManager cameraManager;
    private CaptureRequest.Builder captureRequestBuilder;
    private CameraDevice cameraDevice;
    private Context context;
    private ImageReader pictureImageReader;
    private CameraCaptureSession captureSession;


    public Camera(Activity activity, TextureRegistry.SurfaceTextureEntry flutterSurfaceTexture, MethodChannel.Result result) {
        this.cameraManager = (CameraManager) activity.getSystemService(Service.CAMERA_SERVICE);
        this.context = activity.getApplicationContext();
        this.surfaceTextureEntry = flutterSurfaceTexture;
        this.result = result;
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
        pictureImageReader = ImageReader.newInstance(1080, 720, ImageFormat.JPEG, 2);
        CameraDevice.StateCallback stateCallback = new CameraStateCallback(pictureImageReader, this.result);
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
        captureRequestBuilder = cameraDevice.createCaptureRequest(CameraDevice.TEMPLATE_STILL_CAPTURE);
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

    public void detect(final MethodChannel.Result result) {
        //TODO: Here will be the barcode detection
        BarcodeScannerOptions scannerOptions = new BarcodeScannerOptions.Builder()
                .setBarcodeFormats(Barcode.FORMAT_ALL_FORMATS).build();
        final BarcodeScanner barcodeScanner = BarcodeScanning.getClient(scannerOptions);
        pictureImageReader.setOnImageAvailableListener(new ImageReader.OnImageAvailableListener() {
            @Override
            public void onImageAvailable(ImageReader imageReader) {
                try (Image image = imageReader.acquireLatestImage()) {
                    assert (image != null);
                    ByteBuffer buffer = image.getPlanes()[0].getBuffer();
                    byte[] bytes = new byte[buffer.capacity()];
                    buffer.rewind();
                    if (buffer.hasArray()) {
                        bytes = buffer.array();
                    } else {
                        int i = 0;
                        while (buffer.remaining() > 0) {
                            bytes[i] = buffer.get();
                            i++;
                        }
                    }
                    final ArrayList<String> barcodeValues = new ArrayList<String>();
                    Bitmap bitmapImage = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
                    final Task<List<Barcode>> barcodeResult =
                            barcodeScanner.process(InputImage.fromBitmap(bitmapImage, 0))
                                    .addOnSuccessListener(new OnSuccessListener<List<Barcode>>() {
                                        @Override
                                        public void onSuccess(List<Barcode> barcodes) {
                                            for (Barcode bar : barcodes) {
                                                barcodeValues.add(bar.getRawValue());
                                            }
                                            System.out.println("Barcode Size" + barcodes.size());
                                            Map<String, ArrayList<String>> reply = new HashMap<>();
                                            reply.put("barcodes", barcodeValues);
                                            result.success(reply);

                                        }


                                    })
                                    .addOnFailureListener(new OnFailureListener() {
                                        @Override
                                        public void onFailure(@NonNull Exception e) {
                                            System.out.println("e.printStackTrace()" + e.getMessage());
                                            Map<String, ArrayList<String>> reply = new HashMap<>();
                                            reply.put("barcodes", barcodeValues);
                                            result.success(reply);
                                        }
                                    });
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }, null);
        try {

            captureRequestBuilder.addTarget(pictureImageReader.getSurface());
            captureRequestBuilder.set(CaptureRequest.JPEG_ORIENTATION, 90);
            captureSession.capture(captureRequestBuilder.build(), new CameraCaptureSession.CaptureCallback() {
                @Override
                public void onCaptureStarted(@NonNull CameraCaptureSession session, @NonNull CaptureRequest request, long timestamp, long frameNumber) {
                    super.onCaptureStarted(session, request, timestamp, frameNumber);
                }
            }, null);
        } catch (CameraAccessException e) {
            e.printStackTrace();
        }

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
            captureSession = _cameraCaptureSession;
            captureRequestBuilder.set(
                    CaptureRequest.CONTROL_MODE, CameraMetadata.CONTROL_MODE_AUTO);
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
