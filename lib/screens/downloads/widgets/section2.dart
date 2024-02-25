import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';
import 'package:netflix/screens/downloads/widgets/download_image.dart';

class Section2 extends StatelessWidget {
const  Section2({super.key});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Center(
          child: Text(
            'Introducing Downloads for you',
            style: TextStyle(
                color: kWhite, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        kheight10,
        const Text(
          'We will download personalised selection Of  \nmovies and shows for you,so there is\n  always something to watch on your \n device.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        FutureBuilder<List<String?>>(
          future: Api().getImageDownloadUrl(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  radius: size.width * 0.395,
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
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              );
            }
            return SizedBox(
              height: size.width,
              width: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: size.width * 0.37,
                      backgroundColor: const Color.fromARGB(255, 104, 97, 97)
                          .withOpacity(0.4),
                    ),
                  ),
                  DownloadImageWidget(
                    image: snapshot.data![0],
                    angle: 25,
                    margin: const EdgeInsets.only(left: 160, top: 30),
                    size: Size(size.width * 0.35, size.width * 0.46),
                  ),
                  DownloadImageWidget(
                    image: snapshot.data![1],
                    angle: -25,
                    margin: const EdgeInsets.only(right: 160, top: 30),
                    size: Size(size.width * 0.35, size.width * 0.46),
                  ),
                  DownloadImageWidget(
                    image: snapshot.data![2],
                    angle: 0,
                    margin: const EdgeInsets.only(top: 15),
                    size: Size(size.width * 0.4, size.width * 0.57),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
