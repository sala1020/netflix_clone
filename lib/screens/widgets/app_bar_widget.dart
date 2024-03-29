import 'package:flutter/material.dart';
import 'package:netflix/screens/core/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key,required this.title});
 final String title;
 

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      kwidth,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      const Spacer(),
      const Icon(
        Icons.cast,
        color: Colors.white,
        size: 30,
      ),
      kwidth,
      Container(
        height: 30,
        width: 30,
        color: Colors.blue,
      ),
      kwidth
    ]);
  }
}
