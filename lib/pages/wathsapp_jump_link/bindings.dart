import 'package:get/get.dart';

import 'controller.dart';

class WathsappJumpLinkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WathsappJumpLinkPageController>(
        () => WathsappJumpLinkPageController());
  }
}
