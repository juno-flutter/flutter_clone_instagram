// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';

import '../components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: null,
        // backgroundColor: Colors.white,
        title: ImageData(
          IconsPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 17),
              child: ImageData(IconsPath.directMessage),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView(
          children: [
            _storyBoardList(),
            _postList(),
          ],
        ),
      ),
    );
  }

  Widget _storyBoardList() {
    return Scrollbar(
      interactive: true,
      trackVisibility: true,
      thickness: 5,
      radius: const Radius.circular(2.5),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 10),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _myStoryAvatar(),
            ...List.generate(
              20,
              (index) => const AvatarWidget(
                thumbPath: 'https://img.segye.com/content/image/2015/04/17/20150417002357_0.jpg',
                type: AvatarType.type1,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _myStoryAvatar() {
    return Stack(
      children: [
        const AvatarWidget(
          thumbPath: 'https://www.themoviedb.org/t/p/w500/xUuHj3CgmZQ9P2cMaqQs4J0d4Zc.jpg',
          type: AvatarType.type2,
          size: 70,
        ),
        Positioned(
          right: 5,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueAccent,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: Text(
                '+',
                style: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 0.93,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(10, (index) => const PostWidget()),
    );
  }
}
