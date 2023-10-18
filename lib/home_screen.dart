import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:teste_camera/capture_image.dart';
import 'package:teste_camera/initiate_camera.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController controller;
  bool isControllerInitialized = false;

  void initCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    await controller!.initialize();
    setState(() {
      isControllerInitialized = true;
    });
  }

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!isControllerInitialized) {
      return Scaffold(
        appBar: AppBar(
            title: Text(
          'Carregando Câmera',
        )),
        body: Column(
          children: [Text('Carregando Câmera!')],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Uso da Câmera',
      )),
      body: Column(
        children: [
          Text('Câmera simulada em ação!'),
          CameraPreview(controller!),
          ElevatedButton(
              onPressed: () {
                captureImage(controller);
              },
              child: Text('Tirar Foto'))
        ],
      ),
    );
  }
}
