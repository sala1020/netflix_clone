import 'package:flutter/material.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kwidth,
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        kwidth,
        Text('Smart Downlaods')
      ],
    );
  }
}