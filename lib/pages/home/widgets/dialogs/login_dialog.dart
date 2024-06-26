import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pitchertools/dao/data_manager.dart';
import 'package:pitchertools/http/dio_http.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../index.dart';

class LoginDialog extends GetView<HomePageController> {
  LoginDialog({super.key}) {}

  final controller = Get.find<HomePageController>();

  final TextEditingController userNameTE = TextEditingController();
  final TextEditingController userPwdTE = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('用户登录').center(),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        //设置间隔为8
        children: [
          GFTextField(
            controller: userNameTE,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              labelText: "用户名",
            ),
          ),
          10.heightBox,
          GFTextField(
            controller: userPwdTE,
            obscuringCharacter: "●",
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              labelText: "密码",
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('登录'),
          onPressed: () async {
            Navigator.of(context).pop();
            String name = userNameTE.text;
            String pwd = userPwdTE.text;

            var rp = await DioHttp.post(
                "/login", {"username": name, "password": pwd});

            if (rp["code"] != 0) {
              SmartDialog.showToast(rp["msg"] ?? "登录失败");
              return;
            }
            //保存token
            String token = rp["data"];
            bool saveResult = await DataManager.saveToken(token);

            if (!saveResult) {
              SmartDialog.showToast("保存token失败");
              return;
            }

            //设置默认请求头
            DioHttp.setDefaultHeader("token", token);

            SmartDialog.showToast("登录成功");
          },
        ),
      ],
    );
  }
}
