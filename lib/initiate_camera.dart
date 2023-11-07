import 'package:camera/camera.dart';
import 'package:teste_camera/camera_model.dart';


// Future<void> initCamera(List<CameraDescription> cameras, CameraController cameraController) async {
//   cameras = await availableCameras();
//   cameraController = CameraController(cameras[0], ResolutionPreset.medium);
//   await cameraController.initialize();
// }

CameraModel model = CameraModel();

void initCamera() async {
  var cameras = await availableCameras();
  model.controller = CameraController(cameras[0], ResolutionPreset.medium);
  await model.controller!.initialize();
    model.isInitialized.value = true;
}