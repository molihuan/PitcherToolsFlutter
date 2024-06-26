import 'package:nb_utils/nb_utils.dart';

class DataManager {
  static const DATASTORE_KEY_LOGIN_TOKEN =
      'MLH_PITCHERTOOLS_DATASTORE_KEY_LOGIN_TOKEN';
  static Future<bool> saveToken(String v) {
    return setValue(DATASTORE_KEY_LOGIN_TOKEN, v);
  }

  /// 获取token
  /// 如果没有token，返回空字符串
  static String getToken() {
    return getStringAsync(DATASTORE_KEY_LOGIN_TOKEN);
  }
}
