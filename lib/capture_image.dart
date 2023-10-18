import 'package:camera/camera.dart';

Future<void> captureImage(controller) async {
  XFile file = await controller.takePicture();
  print("Imagem salva em ${file.path}");
}
