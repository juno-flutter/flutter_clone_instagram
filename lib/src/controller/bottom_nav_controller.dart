import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

import '../pages/upload.dart';

enum PageName { home, search, upload, activity, mypage }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.home:
      case PageName.search:
      case PageName.mypage:
      case PageName.activity:
        _changePage(value);
        break;
      case PageName.upload:
        Get.to(() => const Upload());
        break;
    }
  }

  void _changePage(int value) {
    pageIndex(value);
  }
}
