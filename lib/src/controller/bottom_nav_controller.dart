// import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

import '../pages/upload.dart';

enum PageName { home, search, upload, activity, mypage }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> selectedBottomNavHistory = [0];
  GlobalKey<NavigatorState> searchPageNavigationKey = GlobalKey<NavigatorState>();

  static BottomNavController get to => Get.find();

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

  void _changePage(int value, {bool addHistory = true}) {
    pageIndex(value);
    if (addHistory == false) {
      return;
    }

    if (selectedBottomNavHistory.contains(value) == true) {
      selectedBottomNavHistory.remove(value);
    }

    selectedBottomNavHistory.add(value);
    if (kDebugMode) {
      print(selectedBottomNavHistory);
    }
  }

  Future<bool> goBack() async {
    if (selectedBottomNavHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: const <Widget>[
                Text("알 림"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Center(
                  child: Text(
                    "종료 하시겠습니까?",
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(2),
                      shadowColor: MaterialStateProperty.resolveWith((states) => Colors.grey),
                      foregroundColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black;
                        }
                        return Colors.black;
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.grey;
                        }
                        return Colors.yellow;
                      }),
                      textStyle: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return const TextStyle(fontSize: 60, fontWeight: FontWeight.bold);
                        }
                        return const TextStyle(fontSize: 15, fontWeight: FontWeight.normal);
                      }),
                    ),
                    child: const Text("  예  "),
                    onPressed: () {},
                  ),
                  ElevatedButton(
                    child: const Text("아니요"),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          );
        },
      );
      return true;
    }

    var page = PageName.values[selectedBottomNavHistory.last];
    if (page == PageName.search) {
      var value = await searchPageNavigationKey.currentState!.maybePop();
      if (value) return false;
    }

    selectedBottomNavHistory.removeLast();
    _changePage(selectedBottomNavHistory.last, addHistory: false);
    if (kDebugMode) {
      print(selectedBottomNavHistory);
    }
    return false;
  }
}
