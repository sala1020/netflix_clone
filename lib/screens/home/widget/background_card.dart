import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';
import 'package:netflix/screens/home/widget/custum_button.dart';

class BackgroundCard extends StatelessWidget {
 const BackgroundCard({super.key, required this.random});
final  int random;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<Movie>>(
          future: Api().top10Movies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: CircleAvatar(
                  maxRadius: 30,
                  backgroundColor: Colors.grey[800],
                  child: const CircularProgressIndicator(),
                ),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'error',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'List is empty',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return Container(
              height: 550,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl:
                    '$kUrl${snapshot.data![random].posterPath}',
            
                fit: BoxFit.cover, 
              ),
            );
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustumButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                  iconSize: 30,
                  textSize: 16,
                ),
                _playButton(),
                const CustumButtonWidget(
                  icon: Icons.info,
                  title: 'info',
                  iconSize: 30,
                  textSize: 16,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(4.0), // Adjust the radius as needed
            ),
          ),
          backgroundColor: MaterialStateProperty.all(kWhite)),
      icon: const Icon(
        Icons.play_arrow,
        color: kBlack,
        size: 20,
      ),
      label: const Text(
        'Play',
        style: TextStyle(color: kBlack, fontSize: 20),
      ),
    );
  }
}
