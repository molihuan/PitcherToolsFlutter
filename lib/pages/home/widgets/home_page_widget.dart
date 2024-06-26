import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getwidget/getwidget.dart';

import '../../app_pages.dart';
import '../controller.dart';
import 'home_page_appbar.dart';

class HomePageWidget extends GetView<HomePageController> {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppbar(),
      body: Column(
        children: [
          GFButton(
            text: "加粉上、下号",
            fullWidthButton: true,
            onPressed: () {
              Get.toNamed(AppRoutes.WathsappJumpLinkPage, arguments: {});
            },
          ).marginOnly(left: 15, right: 15),
          GFButton(
            text: "查粉",
            fullWidthButton: true,
            onPressed: () {
              Get.toNamed(AppRoutes.QueryFansPage, arguments: {});
            },
          ).marginOnly(left: 15, right: 15),
          GFButton(text: "测试", fullWidthButton: true, onPressed: () {})
              .marginOnly(left: 15, right: 15),
        ],
      ),
    );
  }
}
