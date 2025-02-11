// import 'package:amazone_prime_clone/models/movies.dart';
// import 'package:flutter/material.dart';

// class ListSection extends StatelessWidget {
//   final Future<List<Movie>> moviesfuture;
//   final String title;
//   final double itemHeight;
//   final double itemWidth;
//   final int itemCount;
//   final bool numbers;
//   final Widget? languageTabs;

//   const ListSection({
//     Key? key,
//     required this.moviesfuture,
//     required this.title,
//     required this.itemHeight,
//     required this.itemWidth,
//     required this.itemCount,
//     this.numbers = false,
//     this.languageTabs,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Movie>>(
//       future: moviesfuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text(
//               "Error: ${snapshot.error}",
//               style: const TextStyle(color: Colors.white),
//             ),
//           );
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(
//             child: Text(
//               "No movies available",
//               style: TextStyle(color: Colors.white),
//             ),
//           );
//         } else {
//           final movies = snapshot.data!;
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     color: Color.fromARGB(255, 206, 196, 196),
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: itemHeight,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: itemCount < movies.length
//                       ? itemCount
//                       : movies
//                           .length, // Ensure itemCount doesn't exceed list length
//                   itemBuilder: (context, index) {
//                     final movie = movies[index];
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 5),
//                       child: Stack(
//                         children: [
//                           Container(
//                             width: itemWidth,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                   'https://image.tmdb.org/t/p/w500${movie.posterPath}',
//                                 ),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           if (numbers)
//                             Positioned(
//                               bottom: 0,
//                               left: 0,
//                               child: Text(
//                                 '${index + 1}',
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 100,
//                                   fontWeight: FontWeight.bold,
//                                   shadows: [
//                                     Shadow(
//                                       color: Colors.black,
//                                       blurRadius: 5,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         }
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:amazone_prime_clone/models/movies.dart';

class ListSection extends StatelessWidget {
  final Future<List<Movie>> moviesfuture;
  final String title;
  final double itemHeight;
  final double itemWidth;
  final int itemCount;
  final bool numbers;
  final Widget? languageTabs; // Optional LanguageTabs widget

  const ListSection({
    Key? key,
    required this.moviesfuture,
    required this.title,
    required this.itemHeight,
    required this.itemWidth,
    required this.itemCount,
    this.numbers = false,
    this.languageTabs, // Accepts an optional LanguageTabs widget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: moviesfuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
             'There issue in fetching movies, please try again..',
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              "No movies available",
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          final movies = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 206, 196, 196),
                    fontSize: 20,
                  ),
                ),
              ),
              if (languageTabs != null) // Show languageTabs only if provided
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: languageTabs!,
                ),
              SizedBox(
                height: itemHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      itemCount < movies.length ? itemCount : movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Stack(
                        children: [
                          Container(
                            width: itemWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (numbers)
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 100,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
