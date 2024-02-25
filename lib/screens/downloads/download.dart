
import 'package:flutter/material.dart';
import 'package:netflix/screens/downloads/widgets/section2.dart';
import 'package:netflix/screens/downloads/widgets/section3.dart';
import 'package:netflix/screens/downloads/widgets/smart_doenloads.dart';
import 'package:netflix/screens/widgets/app_bar_widget.dart';

// ignore: must_be_immutable
class DownloadPage extends StatelessWidget {
  DownloadPage({super.key});
  List _widgetList = [const SmartDownloads(), Section2(), const section3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgetList[index],
            separatorBuilder: (context, index) => SizedBox(height: 30),
            itemCount: _widgetList.length));
  }
}




