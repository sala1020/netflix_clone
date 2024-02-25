import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {super.key,
      required this.image,
      this.angle = 0,
      required this.margin,
      required this.size});

  final String? image;
  final double? angle;
  final EdgeInsets margin;
  final Size size;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle! * pi / 180,
        child: Container(
          // margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              color: kBlack,
              image: DecorationImage(
                  image:
                      NetworkImage("$kUrl$image!"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(9)),
        ),
      ),
    );
  }
}
