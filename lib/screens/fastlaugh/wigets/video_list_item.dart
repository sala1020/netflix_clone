import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index, required this.movie});
  final int index;
  final String movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: '$kUrl$movie',
            fit: BoxFit.fill,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: kWhite,
                      size: 30,
                    ),
                  ),
                ),
                //
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://imgs.search.brave.com/3wkGdLiKlOJZKeYePSB0it5mM1HKnm6yHdq1FpNPU2k/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/bmFpcnRlamFzLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAx/OC8xMi9UaG9iYW1h/LXBvc3Rlci5qcGc'),
                      ),
                    ),
                    VideoAcions(icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoAcions(icon: Icons.add, title: 'My List'),
                    VideoAcions(icon: Icons.share, title: 'Share'),
                    VideoAcions(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoAcions extends StatelessWidget {
  const VideoAcions({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
