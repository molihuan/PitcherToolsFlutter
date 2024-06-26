import 'package:get/get.dart';

import 'controller.dart';

class QueryFansBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QueryFansController>(() => QueryFansController());
  }
}
