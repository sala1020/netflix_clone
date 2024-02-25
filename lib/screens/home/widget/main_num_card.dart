import 'package:flutter/material.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/screens/core/constants/constants.dart';
import 'package:netflix/screens/home/widget/number_card.dart';
import 'package:netflix/screens/widgets/main_tiitle.dart';

class MainNumberCard extends StatelessWidget {
  const MainNumberCard({super.key, required this.listNotifier});
  final ValueNotifier<List<Movie>>? listNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5),
          child: MainTitle(title: 'Top 10 T shows in India Today'),
        ),
        kheight10,
        LimitedBox(
            maxHeight: 175,
            child: ValueListenableBuilder(
              valueListenable: listNotifier!,
              builder: (context, value, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    var data = listNotifier!.value[index];
                    return NumberCard(
                      index: index,
                      movie: data,
                    );
                  },
                );
              },
            ))
      ],
    );
  }
}
