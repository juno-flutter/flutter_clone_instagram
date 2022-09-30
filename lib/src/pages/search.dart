// import 'package:flutter/cupertino.dart';
// ignore_for_file: must_call_super

import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/pages/search/search_focus.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<double> widgetHeights = [];
  final List<Color> widgetColors = [];
  final crossAxisCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appBar(),
            Expanded(
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    const maxRandom = 4;

    for (int i = 0; i < 50; i++) {
      var probability = Random().nextInt(maxRandom).toDouble() + 1;
      var height = 1;

      if (probability >= maxRandom) {
        height = 2;
      }
      widgetHeights.add(height * Get.width / crossAxisCount);
      widgetColors.add(Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1));
    }
    setState(() {});
  }

  Widget _appBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Get.to(
              () => const SearchFocus(),
              transition: Transition.leftToRight,
              curve: Curves.easeInOutBack,
              duration: const Duration(milliseconds: 500),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  Text(
                    '검색',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff838383),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.location_pin,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return MasonryGridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      crossAxisCount: crossAxisCount,
      // mainAxisSpacing: 3,
      // crossAxisSpacing: 3,
      itemCount: 50,
      itemBuilder: (context, index) {
        return SizedBox(
          height: widgetHeights[index],
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: CachedNetworkImage(
                fadeInCurve: Curves.easeInOut,
                fadeInDuration: const Duration(seconds: 1),
                imageUrl: 'https://img.segye.com/content/image/2015/04/17/20150417002357_0.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class StatefulWrapper {}
