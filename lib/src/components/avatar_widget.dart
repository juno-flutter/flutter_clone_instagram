import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AvatarType { type1, type2, type3 }

class AvatarWidget extends StatelessWidget {
  final bool? hasStory;
  final String thumbPath;
  final String? nickname;
  final AvatarType type;
  final double? size;
  static const sizeDefault = 65.0;

  const AvatarWidget({
    Key? key,
    required this.thumbPath,
    required this.type,
    this.hasStory,
    this.nickname,
    this.size = sizeDefault,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AvatarType.type1:
        return type1Avatar();
      case AvatarType.type2:
        return type2Avatar();
      case AvatarType.type3:
        return type3Avatar();
    }
    // return Container();
  }

  Widget type1Avatar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.purpleAccent,
            Colors.orange,
            Colors.yellowAccent,
          ],
        ),
      ),
      child: type2Avatar(),
    );
  }

  Widget type2Avatar() {
    var imsiSize = size ?? sizeDefault;
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imsiSize / 2),
        child: SizedBox(
          width: imsiSize,
          height: imsiSize,
          child: CachedNetworkImage(
            imageUrl: thumbPath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget type3Avatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        type1Avatar(),
        Text(nickname ?? '', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
      ],
    );
  }
}
