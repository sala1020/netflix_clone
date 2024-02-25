import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/api/deBouncer.dart';
import 'package:netflix/screens/Search/widget/search_idle.dart';
import 'package:netflix/screens/Search/widget/search_result.dart';
import 'package:netflix/screens/core/constants/constants.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool changer = false;

  final searchController = TextEditingController();
  final deBouncer = DeBouncer(delay: Duration(milliseconds: 500));

  ValueNotifier<bool> showSearchResult = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: searchController,
                backgroundColor: Colors.grey.withOpacity(0.3),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                  size: 17,
                ),
                onSuffixTap: () {
                  searchController.clear();
                  setState(() {
                    changer = false;
                  });
                },
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
          
                    deBouncer.call(() {
                      setState(() {
                        changer = true;
                        showSearchResult.value = true;
                        if (searchController.text.isEmpty) {
                          changer = false;
                          showSearchResult.value = false;
                        }
                      });
                    });
                  
                },
              ),
              kheight10,
              Expanded(
                child: changer
                    ? SearchResultWidget(
                        result: searchController.text,
                      )
                    : SearchIdleWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
