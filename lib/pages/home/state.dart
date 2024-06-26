import 'package:get/get.dart';



class HomePageState {
  //创建视频笔记类型
  final _videoType = Object().obs;

  set videoType(value) => _videoType.value = value;

  get videoType => _videoType.value;

  //笔记路径
  final _noteFilePath = "".obs;

  set noteFilePath(value) => _noteFilePath.value = value;

  get noteFilePath => _noteFilePath.value;
}
