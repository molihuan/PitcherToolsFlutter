import 'package:get/get.dart';

import 'controller.dart';

class WathsappJumpLinkDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WathsappJumpLinkDetailsController>(
        () => WathsappJumpLinkDetailsController());
  }
}
