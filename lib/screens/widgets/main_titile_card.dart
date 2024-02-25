// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/screens/core/constants/constants.dart';
import 'package:netflix/screens/widgets/main_card_home.dart';
import 'package:netflix/screens/widgets/main_tiitle.dart';

class MainTitleCard extends StatelessWidget {
  MainTitleCard({super.key, required this.title, this.listNotifier});
  ValueNotifier<List<Movie>>? listNotifier;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:const EdgeInsets.only(left: 5),
            child: MainTitle(title: title),
          ),
          kheight10,
          LimitedBox(
              maxHeight: 175,
              child: ValueListenableBuilder(
                valueListenable: listNotifier!,
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: listNotifier!.value.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var data = listNotifier!.value[index];
                      return MainCardHome(
                        movie: data,
                      );
                    },
                  );
                },
              ))
        ],
      ),
    );
  }
}
