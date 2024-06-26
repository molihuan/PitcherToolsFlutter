import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'package:path/path.dart';

import '../../dao/data_manager.dart';
import '../../http/dio_http.dart';
import '../app_pages.dart';
import 'index.dart';

class HomePageController extends GetxController {
  final state = HomePageState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    //判断token是否为''
    String token = DataManager.getToken();
    if (token == '') {
      SmartDialog.showToast("请先登录");
      return;
    }
    LogUtil.e("设置了token:$token");
    //设置默认请求头
    DioHttp.setDefaultHeader("token", token);
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
