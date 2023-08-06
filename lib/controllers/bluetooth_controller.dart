import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BlueToothController extends GetxController {
  // create instance
  FlutterBluePlus flutterBlue = FlutterBluePlus();

  Future scanDevice() async {
    // scan device for bluetooth connection, it will scan for 5s
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
    // after the scan, stop
    FlutterBluePlus.stopScan();
  }

  // Show available devices
  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;
}
