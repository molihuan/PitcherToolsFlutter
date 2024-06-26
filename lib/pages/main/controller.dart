import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/controller.dart';
import '../home/view.dart';
import '../user/controller.dart';
import '../user/view.dart';
import 'index.dart';

class MainPageController extends GetxController {
  final state = MainPageState();
  late final List<Widget> pageList;

  ///获取默认传入页面的参数
  Map? getArguments() {
    return null;
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();

    ///注入子视图的控制器,不然会报null异常
    Get.put<HomePageController>(HomePageController());
    Get.put<UserPageController>(UserPageController());

    ///视图列表
    pageList = [const HomePage(), const UserPage()];

    getArguments();
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
