import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
// import 'package:get/get.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _header(),
          _image(),
          const SizedBox(
            height: 10,
          ),
          _infoCount(),
          const SizedBox(
            height: 5,
          ),
          _infoDescription(),
          _replyTextBtn(),
          _dateAgo(),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AvatarWidget(
            type: AvatarType.type3,
            thumbPath: 'https://www.themoviedb.org/t/p/w500/xUuHj3CgmZQ9P2cMaqQs4J0d4Zc.jpg',
            size: 40,
            nickname: 'Haomaru88',
          ),
          GestureDetector(
            onTap: () {},
            child: ImageData(
              IconsPath.postMoreIcon,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
      // margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: CachedNetworkImage(
          imageUrl: 'https://dimg.donga.com/wps/NEWS/IMAGE/2022/08/05/114831489.1.jpg',
        ),
      ),
    );
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              ImageData(IconsPath.likeOffIcon, width: 65),
              const SizedBox(
                width: 15,
              ),
              ImageData(IconsPath.replyIcon, width: 65),
              const SizedBox(
                width: 15,
              ),
              ImageData(IconsPath.directMessage, width: 55),
            ],
          ),
          ImageData(IconsPath.bookMarkOffIcon),
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            'Like 150',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.w900,
            ),
          ),
          ExpandableText(
            '컨텐츠 1 입니다.\n컨텐츠 1 입니다.\n컨텐츠 1 입니다.\n컨텐츠 1 입니다.',
            style: TextStyle(color: Colors.black87),
            prefixText: '개발하는 남자',
            prefixStyle: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
            onPrefixTap: null,
            expandText: 'more',
            linkColor: Colors.blue,
            linkStyle: TextStyle(fontWeight: FontWeight.bold),
            collapseText: '<-',
            expanded: false,
            animation: true,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 200),
            expandOnTextTap: true,
            collapseOnTextTap: true,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Text(
              '댓글 199    모두 보기',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            '1일전',
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
