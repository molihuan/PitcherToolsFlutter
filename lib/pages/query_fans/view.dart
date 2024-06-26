import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class QueryFansPage extends GetView<QueryFansController> {
  const QueryFansPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return GFCard(
      padding: const EdgeInsets.all(2),
      margin: EdgeInsets.all(8),
      content: Row(
        children: [
          Text("客服号"),
          Text("客服号"),
          GFIconButton(
            type: GFButtonType.solid,
            color: Colors.red,
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
          GFIconButton(
            type: GFButtonType.solid,
            color: Colors.red,
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
      ),
    );
    ;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QueryFansController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("查粉"),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ).marginOnly(right: 10),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {},
              ).marginOnly(right: 10),
            ],
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
