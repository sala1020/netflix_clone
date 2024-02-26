import 'package:flutter/material.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';
import 'package:netflix/screens/home/widget/custum_button.dart';

class ComingsoonWidget extends StatelessWidget {
  const ComingsoonWidget({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 40,
          height: 440,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'FEB',
                style: TextStyle(
                    fontSize: 20, color: kGrey, fontWeight: FontWeight.bold),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 440,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(imageurl: movie.backdropPath!,),
              kheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie.title!,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -2,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustumButtonWidget(
                        icon: Icons.notifications,
                        title: 'Remind Me',
                        iconSize: 20,
                        textSize: 13,
                      ),
                      kwidth,
                      CustumButtonWidget(
                        icon: Icons.info_outline,
                        title: 'info',
                        iconSize: 20,
                        textSize: 13,
                      ),
                      kwidth
                    ],
                  ),
                ],
              ),
              Text(
                'Coming On Friday',
                style: TextStyle(color: kGrey, fontWeight: FontWeight.bold),
              ),
              kheight10,
              Text(
                movie.title!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                ),
              ),
              kheight10,
              Expanded(
                child: Text(
                  movie.overview!,
                  style: TextStyle(color: kGrey),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class VideoWidget extends StatelessWidget {
   VideoWidget({
    super.key,
    required this.imageurl

  });
  String imageurl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image(
            image: NetworkImage('$kUrl$imageurl'),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kWhite,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
