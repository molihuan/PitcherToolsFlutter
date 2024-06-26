import 'dart:convert';

import 'package:get/get.dart';

import 'index.dart';

class WathsappJumpLinkDetailsController extends GetxController {
  WathsappJumpLinkDetailsController();

  final state = WathsappJumpLinkDetailsState();

  getArgs() {
    final arguments = Get.arguments as Map;
    dynamic adWebsitePage = arguments["adWebsitePage"];
    state.adWebsitePage = adWebsitePage;
    state.jumpLinks = jsonDecode(adWebsitePage["jump_links"]);
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    getArgs();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
