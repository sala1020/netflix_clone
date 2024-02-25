import 'package:flutter/material.dart';
import 'package:netflix/screens/Search/search.dart';
import 'package:netflix/screens/downloads/download.dart';
import 'package:netflix/screens/fastlaugh/fast_laugh.dart';
import 'package:netflix/screens/home/homepage.dart';
import 'package:netflix/screens/hotandnew/hot_and_new.dart';
import 'package:netflix/screens/mainpage/widgets/bottom_nav.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final pages = [
     HomePage(),
    const HotAndNew(),
    const FastLaugh(),
     SearchPage(),
    DownloadPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        bottomNavigationBar: const BottomNavigationWidget(),
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: indexChanged,
            builder: (context, index, child) {
              return pages[index];
            },
          ),
        ));
  }
}
