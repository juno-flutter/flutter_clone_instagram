// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/avatar_widget.dart';

class ActiveHistory extends StatelessWidget {
  ActiveHistory({Key? key}) : super(key: key);
  final ScrollController _scrollController1 = ScrollController();

  @override
  Widget build(BuildContext context) {
    const thick = 8.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          '활동',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Scrollbar(
        interactive: true,
        trackVisibility: true,
        thickness: thick,
        radius: const Radius.circular(thick/2),
        controller: _scrollController1,
        child: SingleChildScrollView(
          controller: _scrollController1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                _todayActivity(),
                _weekActivity(),
                _monthActivity(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerActivity(String title) {
    return Container(
      width: 80,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  Widget oneActivity() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: const [
          AvatarWidget(thumbPath: 'https://shorturl.at/ckqT6', type: AvatarType.type1),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text.rich(TextSpan(
              text: '하오마루',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: '님이 회원님의 게시물을 좋아합니다.님이 회원님의 게시물을 좋아합니다.',
                  style: TextStyle(fontWeight: FontWeight.normal,),
                ),
                TextSpan(
                  text: ' 5일전',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black45),
                ),

              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget _listActivity(String title, List<Widget> list) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerActivity(title),
          ...list,
        ],
      ),
    );
  }

  Widget _todayActivity() {
    List<Widget> list = [
      oneActivity(),
      oneActivity(),
    ];
    return _listActivity('오늘', list);
  }

  Widget _weekActivity() {
    List<Widget> list = [
      oneActivity(),
      oneActivity(),
      oneActivity(),
      oneActivity(),
    ];
    return _listActivity('이번주', list);
  }

  Widget _monthActivity() {
    List<Widget> list = [
      oneActivity(),
      oneActivity(),
      oneActivity(),
      oneActivity(),
      oneActivity(),
      oneActivity(),
    ];
    return _listActivity('이번달', list);
  }
}
