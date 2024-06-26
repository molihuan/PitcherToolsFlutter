import 'package:get/get.dart';

class WathsappJumpLinkDetailsState {
  var _jumpLinks = [].obs;
  get jumpLinks => _jumpLinks;
  set jumpLinks(value) => _jumpLinks.value = value;

  var _adWebsitePage = {}.obs;
  get adWebsitePage => _adWebsitePage.value;
  set adWebsitePage(value) => _adWebsitePage.value = value;
}
