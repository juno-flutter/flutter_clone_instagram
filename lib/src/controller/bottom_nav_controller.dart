import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../pages/upload.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.MYPAGE:
      case PageName.ACTIVITY:
        _changePage(value);
        break;
      case PageName.UPLOAD:
        Get.to(()=>const Upload());
        break;
    }
  }

  void _changePage (int value) {
    pageIndex(value);
  }
}
