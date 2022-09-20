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

  Future<bool> gotoBack() async {
    if (selectedBottomNavHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            alignment: Alignment.bottomCenter,
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
                      foregroundColor: MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black;
                        }
                        return Colors.white;
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return green, otherwise blue
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.green;
                        }
                        return Colors.blue;
                      }),
                      textStyle: MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return size 40, otherwise 20
                        if (states.contains(MaterialState.pressed)) {
                          return const TextStyle(fontSize: 18);
                        }
                        return const TextStyle(fontSize: 15);
                      }),
                    ),
                    child: const Text("Changing Button"),
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

    selectedBottomNavHistory.removeLast();
    _changePage(selectedBottomNavHistory.last, addHistory: false);
    if (kDebugMode) {
      print(selectedBottomNavHistory);
    }
    return false;
  }
}
