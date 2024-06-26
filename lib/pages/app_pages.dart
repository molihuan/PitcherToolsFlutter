// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pitchertools/pages/query_fans/bindings.dart';
import 'package:pitchertools/pages/query_fans/index.dart';
import 'package:pitchertools/pages/wathsapp_jump_link_details/bindings.dart';
import 'package:pitchertools/pages/wathsapp_jump_link_details/index.dart';
import 'main/bindings.dart';
import 'main/view.dart';
import 'wathsapp_jump_link/bindings.dart';
import 'wathsapp_jump_link/view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.MainPage;

  static final routes = [
    ///主显示页面
    GetPage(
      name: AppRoutes.MainPage,
      page: () => const MainPage(),
      bindings: [
        MainPageBinding(),
      ],
    ),

    ///跳转链接页面
    GetPage(
      name: AppRoutes.WathsappJumpLinkPage,
      page: () => const WathsappJumpLinkPage(),
      bindings: [
        WathsappJumpLinkBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.WathsappJumpLinkDetailsPage,
      page: () => WathsappJumpLinkDetailsPage(),
      bindings: [
        WathsappJumpLinkDetailsBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.QueryFansPage,
      page: () => QueryFansPage(),
      bindings: [
        QueryFansBinding(),
      ],
    ),
  ];
}
