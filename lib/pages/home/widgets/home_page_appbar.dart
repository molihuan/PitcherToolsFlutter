import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../main/controller.dart';
import 'dialogs/login_dialog.dart';

/// 主页的AppBar
class HomePageAppbar extends AppBar {
  @override
  _HomeAppbarState createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomePageAppbar> {
  final controller = Get.find<MainPageController>();

  @override
  Widget build(BuildContext context) {
    return GFAppBar(
      searchBar: true,
      leading: IconButton(
        icon: GFAvatar(
          backgroundImage: AssetImage('assets/images/ml.png'),
          backgroundColor: Colors.transparent,
        ),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) => LoginDialog(),
          );
        },
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('设置'.tr),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
