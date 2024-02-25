import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';
import 'package:netflix/screens/home/homepage.dart';
import 'package:netflix/screens/hotandnew/widget/coming_soon.dart';
import 'package:netflix/screens/hotandnew/widget/everyone_watching.dart';

class HotAndNew extends StatelessWidget {
  const HotAndNew({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: kBlack,
            title: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'New & Hot',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
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
            bottom: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelColor: kBlack,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: kWhite,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ]),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ]),
        ),
      ),
    );
  }
}

Widget _buildComingSoon() {
  return ValueListenableBuilder(
    valueListenable: upComingListNotifier,
    builder: (context, value, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          var data = value[index];
          return ComingsoonWidget(
            movie: data,
          );
        },
        itemCount: 10,
      );
    },
  );
}

Widget _buildEveryonesWatching() {
  return ValueListenableBuilder(
    valueListenable: trendingNowListNotifier,
    builder: (context, value, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          var data = value[index];
          return EveryoneWatching(
            movie: data,
          );
        },
        itemCount: value.length,
      );
    },
  );
}
