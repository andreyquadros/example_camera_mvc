import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'camera_model.dart';

class CameraXController extends GetxController {
  final CameraModel model = CameraModel();

  @override
  void onInit() {
    super.onInit();
    initCamera();
  }

  void initCamera() async {
    var cameras = await availableCameras();
    model.controller = CameraController(cameras[0], ResolutionPreset.medium);
    await model.controller.initialize();
    model.isInitialized.value = true;
  }

}
