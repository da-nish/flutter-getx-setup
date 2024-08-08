import 'package:get/get.dart';

class ControllerA extends GetxController {
  var count = 0.obs;

  void increment() => count++;
}

class ControllerB extends GetxController {
  var count = 0.obs;

  void increment() => count++;
}

class ControllerC extends GetxController {
  var count = 0.obs;

  Worker? worker;

  @override
  void onInit() {
    worker = ever(count, (value) {
      print('counter changed to: $value');
      // if (value == 10) worker?.dispose();
    }, condition: () => count > 5);
    super.onInit();
  }

  void increment() => count++;
}

class ControllerD extends GetxController {
  var count = 0.obs;

  void increment() => count++;
}

class ControllerE extends GetxController {
  var count = 0.obs;

  void increment() => count++;
}
