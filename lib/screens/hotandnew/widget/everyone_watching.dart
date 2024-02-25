import 'package:flutter/material.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';
import 'package:netflix/screens/home/widget/custum_button.dart';
import 'package:netflix/screens/hotandnew/widget/coming_soon.dart';

class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({
    super.key,
    required this.movie
  });
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight10,
        Text(
         movie.title!,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 0,
          ),
        ),
        kheight10,
        Text(
         movie.overview!,
          style: TextStyle(color: kGrey, fontSize: 16),
        ),
        kheight50,
        VideoWidget(imageurl: movie.backdropPath!,),

        kheight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustumButtonWidget(
                icon: Icons.share, title: 'share', iconSize: 25, textSize: 16),
                kwidth,
            CustumButtonWidget(
                icon: Icons.add, title: 'My List', iconSize: 25, textSize: 16),
                kwidth,
            CustumButtonWidget(
                icon: Icons.play_arrow, title: 'Play', iconSize: 25 , textSize: 16),
                kwidth
          ],
        ),
        kheight20,
      ],
    );
  }
}