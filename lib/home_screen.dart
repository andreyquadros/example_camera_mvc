import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'camera_controller.dart';
import 'capture_image.dart';


class HomeScreen extends StatelessWidget {
  final CameraXController controller = Get.put(CameraXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.model.isInitialized.value
            ? 'Uso da Câmera'
            : 'Carregando Câmera')),
      ),
      body: Obx(() {
        if (!controller.model.isInitialized.value) {
          return Column(
            children: [Text('Carregando Câmera!')],
          );
        }
        return Column(
          children: [
            Text('Câmera simulada em ação!'),
            CameraPreview(controller.model.controller),
            ElevatedButton(
                onPressed: () {
                 captureImage(controller.model.controller);
                },
                child: Text('Tirar Foto'))
          ],
        );
      }),
    );
  }
}
