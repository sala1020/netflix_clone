import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/screens/core/constants/constants.dart';
import 'package:netflix/screens/home/widget/background_card.dart';
import 'package:netflix/screens/home/widget/main_num_card.dart';
import 'package:netflix/screens/widgets/main_titile_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

final ValueNotifier<List<Movie>> trendingNowListNotifier =
    ValueNotifier<List<Movie>>([]);

final ValueNotifier<List<Movie>> upComingListNotifier =
    ValueNotifier<List<Movie>>([]);

final ValueNotifier<List<Movie>> topRatedListNotifier =
    ValueNotifier<List<Movie>>([]);

final ValueNotifier<List<Movie>> TopTvShowsListNotifier =
    ValueNotifier<List<Movie>>([]);

final ValueNotifier<List<Movie>> tenseDramasListNotifier =
    ValueNotifier<List<Movie>>([]);

int randomIndex = 0;

class HomePage extends StatelessWidget {
  HomePage({super.key});

  fetchDatas() async {
    trendingNowListNotifier.value = await Api().top10Movies();
    upComingListNotifier.value = await Api().upComing();
    topRatedListNotifier.value = await Api().topRated();
    TopTvShowsListNotifier.value = await Api().top10TvShowsInIndiaTodayUrl();
    tenseDramasListNotifier.value = await Api().tenseDramas();

    final random = Random();
    randomIndex = random.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    fetchDatas();
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    BackgroundCard(random: randomIndex),
                    MainTitleCard(
                        title: 'Top Rated', listNotifier: topRatedListNotifier),
                    kheight10,
                    MainTitleCard(
                      title: 'Trending Now',
                      listNotifier: trendingNowListNotifier,
                    ),
                    kheight10,
                    MainNumberCard(
                      listNotifier: TopTvShowsListNotifier,
                    ),
                    kheight10,
                    MainTitleCard(
                        title: 'Tense Drmas',
                        listNotifier: tenseDramasListNotifier),
                    kheight10,
                    MainTitleCard(
                        title: 'Upccoming', listNotifier: upComingListNotifier),
                  ],
                ),
                scrollNotifier.value
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 00),
                        height: 80,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black,
                                  Color.fromARGB(3, 2, 2, 2)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.1, 0.8])),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Image(
                                  image: NetworkImage(
                                      'https://imgs.search.brave.com/imkzhHztP4DfAIJe33dMDBTCvZFs15VVOKrdqtOgaP4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wbmdp/bWcuY29tL3VwbG9h/ZHMvbmV0ZmxpeC9z/bWFsbC9uZXRmbGl4/X1BORzIyLnBuZw'),
                                  width: 50,
                                  height: 50,
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
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('TV Shows', style: kHomeTitleText),
                                Text(
                                  'Movies',
                                  style: kHomeTitleText,
                                ),
                                Text(
                                  'Categories',
                                  style: kHomeTitleText,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : kheight10
              ],
            ),
          ),
        );
      },
    ));
  }
}
