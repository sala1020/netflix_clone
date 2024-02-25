import 'package:flutter/material.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';

class section3 extends StatelessWidget {
  const section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: MaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kButtonColorBlue,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
      kheight10,
      MaterialButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: kButtonColorWhite,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'See what you can download',
            style: TextStyle(
                color: kBlack, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      )
    ]);
  }
}