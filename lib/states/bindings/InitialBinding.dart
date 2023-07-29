import 'package:cracktech/states/controller/movieController.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieController());
  }
}
