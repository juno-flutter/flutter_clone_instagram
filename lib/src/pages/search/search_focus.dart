// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:get/get.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 5,
      vsync: this,
      animationDuration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        elevation: 0,
        // backgroundColor: Colors.grey.shade100,
        leading: Container(
          padding: const EdgeInsets.all(15),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: ImageData(IconsPath.backBtnIcon),
          ),
        ),
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xffefefef),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '검색',
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              isDense: false,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: Container(
            // padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xffe4e4e4))),
              // color: Colors.grey.shade50,
            ),
            // width: Size.infinite.width,
            height: AppBar().preferredSize.height,
            child: TabBar(
              indicatorWeight: 2,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                // border: Border.symmetric(vertical: BorderSide(color: Colors.blue, width: 5)),
                color: Colors.tealAccent,
                // shape: BoxShape.rectangle,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              splashBorderRadius: const BorderRadius.all(Radius.elliptical(30, 30)),
              controller: tabController,
              indicatorColor: Colors.teal,
              tabs: [
                tabMenuOne('인기'),
                tabMenuOne('계정'),
                tabMenuOne('오디오'),
                tabMenuOne('태그'),
                tabMenuOne('장소'),
              ],
            ),
          ),
        ),
      ),
      body: Container(),
    );
  }
}

Widget tabMenuOne(String menu) {
  return Container(
    // alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      menu,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
