import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pitchertools/pages/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import 'index.dart';

///WathsApp跳转页面
class WathsappJumpLinkPage extends GetView<WathsappJumpLinkPageController> {
  const WathsappJumpLinkPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(BuildContext context) {
    List adWebsitePageList = controller.state.adWebsitePageList;
    return ListView.builder(
        itemCount: adWebsitePageList.length,
        itemBuilder: (context, index) {
          var item = adWebsitePageList[index];

          return GFCard(
            padding: const EdgeInsets.all(0),
            content: GFListTile(
                titleText: item["company_name"],
                subTitleText: item["domain_name"] + "," + item["remark"],
                onTap: () {
                  Get.toNamed(AppRoutes.WathsappJumpLinkDetailsPage,
                      arguments: {'adWebsitePage': item});
                }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WathsappJumpLinkPageController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("加粉上、下号"),
          ),
          body: SafeArea(
            child: Obx(() => _buildView(context)),
          ),
        );
      },
    );
  }
}
