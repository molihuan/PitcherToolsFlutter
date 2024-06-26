import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:pitchertools/http/dio_http.dart';

import 'index.dart';

class WathsappJumpLinkPageController extends GetxController {
  WathsappJumpLinkPageController();

  final state = WathsappJumpLinkPageState();

  /// 在 widget 内存中分配后立即调用。
  @override
  Future<void> onInit() async {
    super.onInit();
    //请求数据
    var rp = await DioHttp.get("/adWebsitePageManagement/adWebsitePageList");
    print(rp);
    if (rp["code"] != 0) {
      SmartDialog.showToast(rp["msg"] ?? "获取失败");
      return;
    }
    List<dynamic> adWebsitePageList = rp["data"];
    state.adWebsitePageList = adWebsitePageList;
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
