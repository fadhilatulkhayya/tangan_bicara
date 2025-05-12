import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;

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

    // Setelah permission diberikan, inisialisasi kamera
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
    if (!_controller!.value.isInitialized || _controller!.value.isTakingPicture) return;
    try {
      final XFile picture = await _controller!.takePicture();
      // Tampilkan snackbar konfirmasi
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Foto berhasil diambil: ${picture.path}')));
    } catch (e) {
      print("Error mengambil gambar: $e");
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
            // Tampilkan kamera jika sudah siap
            if (_isCameraInitialized && _controller != null)
              CameraPreview(_controller!)
            else
              const Center(child: CircularProgressIndicator()),

            // Tombol kembali (X)
            Positioned(
              top: 16,
              left: 16,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),

            // Tombol ambil gambar
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
                      border: Border.all(
                        color: const Color(0xFFB6935E),
                        width: 4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
