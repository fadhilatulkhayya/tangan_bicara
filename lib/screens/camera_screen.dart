import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tangan_bicara/service/api_service.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  String? _prediction;

  @override
  void initState() {
    super.initState();
    _requestCameraPermissionAndInitialize();
  }

  Future<void> _requestCameraPermissionAndInitialize() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }

    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _controller = CameraController(_cameras![0], ResolutionPreset.medium);
      await _controller!.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized || _controller!.value.isTakingPicture)
      return;

    try {
      final XFile picture = await _controller!.takePicture();
      final File imageFile = File(picture.path);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("📷 Gambar berhasil diambil. Mengirim ke API...")),
      );

      final result = await ApiService.predict(imageFile);

      if (result != null && result.containsKey('predicted_class')) {
        setState(() {
          _prediction = result['predicted_class'];
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  "🔤 Prediksi: ${result['predicted_class']} (Akurasi: ${(result['confidence'] * 100).toStringAsFixed(2)}%)")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("❌ Gagal mendapatkan prediksi.")),
        );
      }
    } catch (e) {
      print("❌ Error mengambil gambar: $e");
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            if (_isCameraInitialized && _controller != null)
              CameraPreview(_controller!)
            else
              const Center(child: CircularProgressIndicator()),
            Positioned(
              top: 16,
              left: 16,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: GestureDetector(
                  onTap: _takePicture,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: const Color(0xFFB6935E), width: 4),
                    ),
                  ),
                ),
              ),
            ),
            if (_prediction != null)
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "Prediksi: $_prediction",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
