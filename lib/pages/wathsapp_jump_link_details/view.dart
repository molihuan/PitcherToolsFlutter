import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../http/dio_http.dart';
import '../app_pages.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class WathsappJumpLinkDetailsPage
    extends GetView<WathsappJumpLinkDetailsController> {
  WathsappJumpLinkDetailsPage({Key? key}) : super(key: key);

  List jumpLinks = [];
  List<TextEditingController> urlTECs = [];

  // 主视图
  Widget _buildView(BuildContext context) {
    jumpLinks = controller.state.jumpLinks ?? [];
    urlTECs = List.generate(jumpLinks.length,
        (index) => TextEditingController(text: jumpLinks[index]['url']));
    return Column(
      children: [
        Obx(
          () => ListView.builder(
            itemCount: jumpLinks.length,
            itemBuilder: (context, index) {
              var item = jumpLinks[index];
              return GFCard(
                padding: const EdgeInsets.all(2),
                margin: EdgeInsets.all(8),
                content: Row(
                  children: [
                    GFTextField(
                      controller: urlTECs[index],
                      fieldinitialValue: item["url"],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                      ),
                    ).expand(),
                    Switch(
                        value: item['status'],
                        onChanged: (v) {
                          item['status'] = v;
                          controller.update();
                        }),
                    GFIconButton(
                        type: GFButtonType.solid,
                        color: Colors.red,
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          jumpLinks.removeAt(index);
                          urlTECs.removeAt(index);
                        }),
                  ],
                ),
              );
            },
          ).expand(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GFButton(
                text: "提交",
                onPressed: () async {
                  var jumpLinks = controller.state.jumpLinks;
                  for (var i = 0; i < jumpLinks.length; i++) {
                    var item = jumpLinks[i];
                    item['url'] = urlTECs[i].text;
                  }
                  print(jumpLinks);

                  var rqData = {
                    'id': controller.state.adWebsitePage['id'],
                    'jump_links': jsonEncode(jumpLinks)
                  };

                  print(rqData);

                  //请求数据
                  var rp = await DioHttp.put(
                      "/adWebsitePageManagement/adWebsitePage", rqData);
                  print(rp);
                  if (rp["code"] != 0) {
                    SmartDialog.showToast(rp["msg"] ?? "失败");
                    return;
                  }
                  SmartDialog.showToast(rp["msg"] ?? "成功");
                }).marginAll(5).expand(),
            GFButton(
                text: "取消",
                onPressed: () {
                  Get.back();
                }).marginAll(5).expand(),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WathsappJumpLinkDetailsController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  jumpLinks.add({"url": "", "status": true});
                  urlTECs.add(TextEditingController(text: ''));
                },
              ).marginOnly(right: 10),
            ],
            title: Obx(() {
              var adWebsitePage = controller.state.adWebsitePage;
              return Text(adWebsitePage["domain_name"] +
                  "-->" +
                  adWebsitePage["company_name"]);
            }),
          ),
          body: SafeArea(
            child: _buildView(context),
          ),
        );
      },
    );
  }
}
