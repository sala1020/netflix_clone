import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/infrastructure/api_key.dart';
import 'package:netflix/model/movie_model.dart';

class Api {
  //Download Image
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey';
  Future<List<String?>> getImageDownloadUrl() async {
    final response = await http.get(Uri.parse(_trendingUrl));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['results'] as List;
      final data = responseData
          .map((e) => Movie.fromJson(e).posterPath) // Use ?. operator
          .toList();

      return data;
    } else {
      throw Exception('error');
    }
  }
  //Top10

  Future<List<Movie>> top10Movies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['results'] as List;
      return responseData.map((trending) => Movie.fromJson(trending)).toList();
    } else {
      throw Exception(Exception);
    }
  }

  //Upcoming
  static const _upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  Future<List<Movie>> upComing() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['results'] as List;
      return responseData.map((upComing) => Movie.fromJson(upComing)).toList();
    } else {
      throw Exception('error');
    }
  }

  //Top10TvShows
  static const _top10TvShowsInIndiaTodayUrl =
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&sort_by=popularity.desc';
  Future<List<Movie>> top10TvShowsInIndiaTodayUrl() async {
    final response = await http.get(Uri.parse(_top10TvShowsInIndiaTodayUrl));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['results'] as List;
      return responseData.map((tvShows) => Movie.fromJson(tvShows)).toList();
    } else {
      throw Exception('error');
    }
  }

  //TopRated
  static const _topRated =
      'https://api.themoviedb.org/3/discover/movie?api_key=a2e628e1dd992c96e4d39bcb5273b629&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200';
  Future<List<Movie>> topRated() async {
    final response = await http.get(Uri.parse(_topRated));
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)['results'] as List;
      return responseData.map((topRated) => Movie.fromJson(topRated)).toList();
    } else {
      throw Exception('error');
    }
  }

  //tenseDramas
  static const tensedramaUrl =
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=18';

  Future<List<Movie>> tenseDramas() async {
    final response = await http.get(Uri.parse(tensedramaUrl));
    if (response.statusCode == 200) {
      final resposeData = jsonDecode(response.body)['results'] as List;
      return resposeData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception(Exception);
    }
  }

  //before Search
  static const searchPageIdleUrl =
      'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey';
  Future<List<Movie>> searchPageIdle() async {
    final respose = await http.get(Uri.parse(searchPageIdleUrl));
    if (respose.statusCode == 200) {
      final responseData = jsonDecode(respose.body)['results'] as List;
      return responseData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('error');
    }
  }

  Future<List<Movie>> searchResult(String movie)async{
   String result='https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$movie';
   final response=await http.get(Uri.parse(result));
   if(response.statusCode==200){
    final responseData=jsonDecode(response.body)['results'] as List;
    return responseData.map((movie) => Movie.fromJson(movie)).toList();
   }else{
    throw Exception('error');
   }
  }



  Future<List<String?>> fastLaugh()async{
    final response=await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode==200){
      final responseData=jsonDecode(response.body)['results'] as List;
      return responseData.map((imageUrl) => Movie.fromJson(imageUrl).posterPath).toList();
    }else{
      throw Exception('error');
    }
  }
}
