import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'index.dart';

///用户页面
class UserPage extends GetView<UserPageController> {
  const UserPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        GFButton(text: "测试", onPressed: () async {}),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserPageController>(
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
