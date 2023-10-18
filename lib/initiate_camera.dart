import 'package:camera/camera.dart';


Future<void> initCamera(List<CameraDescription> cameras, CameraController cameraController) async {
  cameras = await availableCameras();
  cameraController = CameraController(cameras[0], ResolutionPreset.medium);
  await cameraController.initialize();
}
