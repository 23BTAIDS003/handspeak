import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class PracticeScreen extends StatefulWidget {
  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  late CameraController _cameraController;
  bool _isInitialized = false;
  String _recognizedSign = "Detected Sign: None";

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[1], ResolutionPreset.high, enableAudio: false);
    await _cameraController.initialize();
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Practice Signs")),
      body: Column(
        children: [
          if (_isInitialized)
            Expanded(child: CameraPreview(_cameraController)),
          Text("Camera initialized. You can now practice signs!"),
          Text(_recognizedSign),
        ],
      ),
    );
  }
}