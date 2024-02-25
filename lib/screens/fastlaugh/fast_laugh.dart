import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/screens/fastlaugh/wigets/video_list_item.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: Api().fastLaugh(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          }
          return PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              10,
              (index) {
                var data = snapshot.data![index];

                return VideoListItem(
                  index: index,
                  movie: data!,
                );
              },
            ),
          );
        },
      )),
    );
  }
}
