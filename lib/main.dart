import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import 'pages/app_pages.dart';

Future<void> main(List args) async {
  /// 插件初始化
  WidgetsFlutterBinding.ensureInitialized();

  ///init  nb_utils
  await initialize();
  LogUtil.init(isDebug: true);

  runApp(const MainWindow());
}

///主窗口
class MainWindow extends StatelessWidget {
  const MainWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),

      debugShowCheckedModeBanner: false,

      /// 初始路由
      initialRoute: AppPages.INITIAL,

      /// 所有的页面
      getPages: AppPages.routes,

      ///flutter_smart_dialog初始化
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      // 设置nb_util的全局key
      navigatorKey: navigatorKey,
    );
  }
}
