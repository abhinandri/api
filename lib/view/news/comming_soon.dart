// // import 'package:flutter/material.dart';

// // class ComingSoon extends StatelessWidget {
// //   const ComingSoon({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(child: Text("Coming Soon"));
// //   }
// // }
// import 'package:amazone_prime_clone/api/api.dart';
// import 'package:amazone_prime_clone/models/movies.dart';
// import 'package:flutter/material.dart';

// class ComingSoon extends StatefulWidget {
//   const ComingSoon({super.key});

//   @override
//   _ComingSoonState createState() => _ComingSoonState();
// }

// class _ComingSoonState extends State<ComingSoon> {
//   bool _isExpanded = false;

//   final String fullDescription =
//       "An exciting new release that's coming soon to keep you on the edge of your seat. Stay tuned for more information as the release date approaches.";

//   List<String> descriptionLines = [];

//   late Future<List<Movie>> ComingSoon;
//   @override
//   void initState() {
//     super.initState();
//     descriptionLines.add("${fullDescription.split(',')[0]}");

//     ComingSoon = Api().getComingSoonMovies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: ListView.builder(
//           itemCount: 10, // Just a placeholder for the number of items
//           itemBuilder: (context, index) => Container(
//             width: double.infinity,
//             color: Colors.black,
//             margin: const EdgeInsets.only(bottom: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Image section (Placeholder)
//                 Container(
//                   height: 230,
//                   color: Colors.blueGrey, // Placeholder for coming soon poster
//                 ),

//                 // Category
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     "Coming Soon", // Static category
//                     style: TextStyle(
//                         color: Colors.orange,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),

//                 // Info Row
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Wrap(
//                     spacing: 5, // Add spacing between elements
//                     children: [
//                       Text("2023",
//                           style:
//                               TextStyle(color: Colors.white60, fontSize: 15)),
//                       CircleAvatar(radius: 2, backgroundColor: Colors.white60),
//                       Text("2h 30m",
//                           style:
//                               TextStyle(color: Colors.white60, fontSize: 15)),
//                       CircleAvatar(radius: 2, backgroundColor: Colors.white60),
//                       Text("4 Languages",
//                           style:
//                               TextStyle(color: Colors.white60, fontSize: 15)),
//                       CircleAvatar(radius: 2, backgroundColor: Colors.white60),
//                       Text("Adventure",
//                           style:
//                               TextStyle(color: Colors.white60, fontSize: 15)),
//                       CircleAvatar(radius: 2, backgroundColor: Colors.white60),
//                       Text("Fantasy",
//                           style:
//                               TextStyle(color: Colors.white60, fontSize: 15)),
//                     ],
//                   ),
//                 ),

//                 // Description
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _isExpanded = !_isExpanded;
//                         descriptionLines = _isExpanded
//                             ? fullDescription.split(',')
//                             : ["${fullDescription.split(',')[0]}"];
//                       });
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           descriptionLines.join(','),
//                           style: const TextStyle(color: Colors.white60),
//                           maxLines: _isExpanded ? null : 2, // Limit lines
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           _isExpanded ? "See Less" : "See More",
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 14),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 // Buttons Row
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton.icon(
//                           onPressed: () {},
//                           icon: const Icon(Icons.notifications,
//                               color:
//                                   Colors.black), // Changed to a reminder icon
//                           label: const Text("Remind Me",
//                               style: TextStyle(color: Colors.black)),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:amazone_prime_clone/api/api.dart';
import 'package:amazone_prime_clone/models/movies.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  bool _isExpanded = false;
  final String fullDescription =
      "An exciting new release that's coming soon to keep you on the edge of your seat. Stay tuned for more information as the release date approaches.";

  List<String> descriptionLines = [];
  late Future<List<Movie>> comingSoonMovies;

  @override
  void initState() {
    super.initState();
    descriptionLines.add("${fullDescription.split(',')[0]}");
    comingSoonMovies = Api().getComingSoonMovies(); // Fetch movies
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder<List<Movie>>(
          future: comingSoonMovies,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text("Error loading movies",
                      style: TextStyle(color: Colors.white)));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text("No upcoming movies",
                      style: TextStyle(color: Colors.white)));
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Movie movie = snapshot.data![index];

                return Container(
                  width: double.infinity,
                  color: Colors.black,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Movie Poster
                      Container(
                        height: 230,
                        decoration: BoxDecoration(
                          image: movie.posterPath != null
                              ? DecorationImage(
                                  image: NetworkImage(movie.posterPath!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          color:
                              movie.posterPath == null ? Colors.blueGrey : null,
                        ),
                      ),

                      // Category
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Coming Soon",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),

                      // Movie Info Row
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Wrap(
                          spacing: 5,
                          children: [
                            Text("2023",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 15)),
                            CircleAvatar(
                                radius: 2, backgroundColor: Colors.white60),
                            Text("2h 30m",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 15)),
                            CircleAvatar(
                                radius: 2, backgroundColor: Colors.white60),
                            Text("4 Languages",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 15)),
                            CircleAvatar(
                                radius: 2, backgroundColor: Colors.white60),
                            Text("Adventure",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 15)),
                            CircleAvatar(
                                radius: 2, backgroundColor: Colors.white60),
                            Text("Fantasy",
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 15)),
                          ],
                        ),
                      ),

                      // Description
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                              descriptionLines = _isExpanded
                                  ? fullDescription.split(',')
                                  : ["${fullDescription.split(',')[0]}"];
                            });
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                descriptionLines.join(','),
                                style:
                                    const TextStyle(color: Colors.white60),
                                maxLines: _isExpanded ? null : 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                _isExpanded ? "See Less" : "See More",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Buttons Row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.notifications,
                                    color: Colors.black),
                                label: const Text("Remind Me",
                                    style: TextStyle(color: Colors.black)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
