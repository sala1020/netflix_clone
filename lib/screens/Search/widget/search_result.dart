import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/screens/core/colors/colors.dart';
import 'package:netflix/screens/core/constants/constants.dart';
import 'package:netflix/screens/widgets/main_tiitle.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.result});
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: 'Movies & TV'),
        kheight10,
        Expanded(
            child: FutureBuilder(
                future: Api().searchResult(result),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.none) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: kWhite,
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error Occured'),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('No result found'),
                    );
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1.2 / 1.6,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      return MainCard(
                        movie: data,
                      );
                    },
                  );
                }))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      child: CachedNetworkImage(
        imageUrl: movie.posterPath != null
            ? '$kUrl${movie.posterPath}'
            : 'https://st.depositphotos.com/1074452/3285/i/450/depositphotos_32851613-stock-illustration-smileys-showing-happy-positive-faces.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
