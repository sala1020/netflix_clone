import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';

class MainCardHome extends StatelessWidget {
  MainCardHome({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5, left: 2),
      height: 160,
      width: 105,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
      ),
      child: CachedNetworkImage(
        imageUrl: '$kUrl${movie.posterPath}',
        placeholder: (context, url) {
          return Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: kBlack,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          );
        },
      ),
    );
  }
}
