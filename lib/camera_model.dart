import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraModel {
  RxBool isInitialized = false.obs;
  late CameraController controller;
}