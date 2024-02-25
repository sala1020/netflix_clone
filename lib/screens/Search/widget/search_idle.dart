import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';
import 'package:netflix/screens/widgets/main_tiitle.dart';

const imageUrl =
    'https://imgs.search.brave.com/w1mS_M9mjZLjoENFZoAEypN40tvPst3GPOrb6uC35_Q/rs:fit:860:0:0/g:ce/aHR0cHM6Ly91c2Vy/Y29udGVudC5vbmUv/d3Avd3d3LnBsdW1l/cmlhbW92aWVzLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAx/OS8wOS9CYW5nYWxv/cmUtRGF5cy0xLTg0/MHg0MjAuanBnP21l/ZGlhPTE3MDI1NzMx/Mzk';

ValueNotifier<List<Movie>> searchIdleNotifier = ValueNotifier<List<Movie>>([]);

// ignore: must_be_immutable
class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  _SearchIdleWidgetState createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  final ValueNotifier<List<Movie>> searchIdleNotifier =
      ValueNotifier<List<Movie>>([]);

  @override
  void initState() {
    super.initState();
    fetchMovieData();
  }

  Future<void> fetchMovieData() async {
    final movies = await Api().searchPageIdle();
    searchIdleNotifier.value = movies;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: 'Top Searches'),
        kheight10,
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: searchIdleNotifier,
            builder: (context, movies, child) {
              if (movies.isEmpty) {
                return Center(child: Text('empty List'));
              } else {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    var movie = movies[index];
                    return TopSearchItemTile(movie: movie);
                  },
                  separatorBuilder: (context, index) => kheight20,
                  itemCount: movies.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screenWidth * 0.3,
          height: 65,
          child: CachedNetworkImage(
              imageUrl:
                  '$kUrl${movie.backdropPath}'),
        ),
        kwidth,
        Expanded(
          flex: 2,
          child: Text(
            movie.title!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhite,
          radius: 25,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: kBlack,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      CupertinoIcons.play_fill,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
