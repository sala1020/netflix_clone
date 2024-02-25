import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.movie});
  final int index;

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 30,
              height: 175,
            ),
            Container(
              height: 175,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
              ),
              child: CachedNetworkImage(
                imageUrl: '$kUrl${movie.posterPath}',
                placeholder: (context, url) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kWhite,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          left: -6,
          bottom: -40,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: const Color.fromARGB(255, 177, 177, 177),
            child: Text(
              '${index + 1}',
              style: GoogleFonts.roboto(
                  fontSize: 130,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
