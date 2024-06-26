import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/home_page_widget.dart';
import 'widgets/widgets.dart';

///笔记列表页面
class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: HomePageWidget(),
          ),
        );
      },
    );
  }
}
