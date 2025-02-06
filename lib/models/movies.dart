// class Movie {
//   String title;
//   String backDropPath;
//   String overview;
//   String posterpath;
//   String releaseDate;

//   Movie(
//       {required this.title,
//       required this.backDropPath,
//       required this.overview,
//       required this.posterpath,
//       required this.releaseDate});

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//         title: json["title"],
//         backDropPath: json["jbackDropPath"],
//         overview: json["overview"],
//         posterpath: json["posterpath"],
//         releaseDate: json["releaseDate"]);
//   }
// }


//       // "backdrop_path": "/vYqt6kb4lcF8wwqsMMaULkP9OEn.jpg",
//       // "id": 1241982,
//       // "title": "Moana 2",
//       // "original_title": "Moana 2",
//       // "overview": "After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new crew to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she's ever faced.",
//       // "poster_path": "/aLVkiINlIeCkcZIzb7XHzPYgO6L.jpg",
//       // "media_type": "movie",
//       // "adult": false,
//       // "original_language": "en",
//       // "genre_ids": [16, 12, 10751, 35, 9648],
//       // "popularity": 2859.74,
//       // "release_date": "2024-11-21",
//       // "video": false,
//       // "vote_average": 7.2,
//       // "vote_count": 1147

//   //     String title;
//   // String backdropPath;
//   // String overview;
//   // String posterPath;
//   // String releaseDate;
  class Movie {
  String title;
  String backDropPath;
  String overview;
  String posterPath;  // Use camel case for consistency
  String releaseDate;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.overview,
    required this.posterPath,  // Consistent camel case
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      backDropPath: json["backdrop_path"],  // Corrected the key here
      overview: json["overview"],
      posterPath: json["poster_path"],  // Corrected the key here
      releaseDate: json["release_date"],  // Corrected the key here
    );
  }
}
