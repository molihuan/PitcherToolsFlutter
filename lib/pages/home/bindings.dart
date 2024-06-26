import 'package:get/get.dart';

import 'controller.dart';

class NotesPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());

  }
}
