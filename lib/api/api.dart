import 'dart:convert';
import 'dart:developer';
import 'package:amazone_prime_clone/constants.dart';
import 'package:amazone_prime_clone/models/search_model.dart';
import 'package:http/http.dart' as http;
import '../models/movies.dart';

const baseUrl = "https://api.themoviedb.org/3/";
late String endPoint;

class Api {
  static const String _trendingUrl =
      '${baseUrl}trending/movie/day?api_key=${AppApi.apiKey}';

  static const String _LatestUrl =
      '${baseUrl}movie/now_playing?api_key=${AppApi.apiKey}';

  static const String _SearchMoviesUrl =
      '${baseUrl}search/movie?api_key=${AppApi.apiKey}';

  static const String _comingsoonUrl =
      '${baseUrl}movie/upcoming?api_key=${AppApi.apiKey}';

  static const String _popularUrl =
      '${baseUrl}movie/popular?api_key=${AppApi.apiKey}';
//
  static const String _topratedUrl =
      '${baseUrl}movie/top_rated?api_key=${AppApi.apiKey}';

  static const String _getUrl = 'https://api.adviceslip.com/advice?';


    Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(Uri.parse(_getUrl));

      if (response.statusCode == 200) {
        final List<dynamic> decodeData = json.decode(response.body)['results'];
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
            'Failed to fetch movies: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }

    // throw Exception('Failed to fetch movies: Status ${response.statusCode}');
  }


  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await http.get(Uri.parse(_trendingUrl));

      if (response.statusCode == 200) {
        final List<dynamic> decodeData = json.decode(response.body)['results'];
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
            'Failed to fetch movies: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }

    // throw Exception('Failed to fetch movies: Status ${response.statusCode}');
  }

  Future<List<Movie>> getLatestMovies() async {
    try {
      final response = await http.get(Uri.parse(_LatestUrl));

      if (response.statusCode == 200) {
        final List<dynamic> decodeData = json.decode(response.body)['results'];
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
            'Failed to fetch movies: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  Future<List<Movie>> getComingSoonMovies() async {
    try {
      final response = await http.get(Uri.parse(_comingsoonUrl));

      if (response.statusCode == 200) {
        final List<dynamic> decodeData = json.decode(response.body)['results'];
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
            'Failed to fetch movies: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await http.get(Uri.parse(_popularUrl));

      if (response.statusCode == 200) {
        final List<dynamic> decodeData = json.decode(response.body)['results'];
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
            'Failed to fetch movies: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    try {
      final response = await http.get(Uri.parse(_topratedUrl));

      if (response.statusCode == 200) {
        final List<dynamic> decodeData = json.decode(response.body)['results'];
        return decodeData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
            'Failed to fetch movies: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

///////////////////////////////
  Future<SearchModel> getSearchMovies(String query) async {
    endPoint = "search/movie?query=$query";
    final url = "$baseUrl$endPoint";

    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjc2MmVjMWQ0MzFkMDQ1ZjA2ZWY2ZDE5OWJhODZiZSIsIm5iZiI6MTcxOTY2MjgxOC4zMjkwMjMsInN1YiI6IjY2N2ZlMTZmMmQ2ODg4NmUyOWVmMjY0ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hABuFp5trCnswWFp_ZOJP67LzAHcPQ6XmoItxqnxsjw"
    });

    if (response.statusCode == 200) {
      log("Success");
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Field to load serached movie");
  }
}
