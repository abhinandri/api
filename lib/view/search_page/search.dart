
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:amazone_prime_clone/api/api.dart';
import 'package:amazone_prime_clone/models/movies.dart';
import 'package:amazone_prime_clone/view/custome_text_gride.dart';
import 'package:amazone_prime_clone/view/top10_language.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Future<List<Movie>> _movies;
  List<Movie> _filteredMovies = [];
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  bool _isSearching = false; // To track loading state

  @override
  void initState() {
    super.initState();
    _movies = Api().getLatestMovies();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    setState(() {
      _isSearching = true; // Show loading icon
    });

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      String query = _searchController.text.trim().toLowerCase();
      log('Searching for: $query');

      if (query.isEmpty) {
        setState(() {
          _filteredMovies = [];
          _isSearching = false; // Hide loading icon
        });
        return;
      }

      List<Movie> allMovies = await _movies;
      List<Movie> filteredResults = allMovies
          .where((movie) => movie.title.toLowerCase().contains(query))
          .toList();

      setState(() {
        _filteredMovies = filteredResults;
        _isSearching = false; // Hide loading icon after search
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 12, right: 12),
            child: TextFormField(
            
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for 'Movie'",
                hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                prefixIcon: const Icon(Icons.search_outlined,
                    color: Colors.white, size: 28),
                suffixIcon: _isSearching
                    ? Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : const Icon(Icons.mic_none_outlined,
                        color: Colors.white, size: 28),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(text: 'Trending in'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: LanguageTabs(
              languages: [
                'India',
                'Movies',
                'Shows',
                'Action',
                'Comedy',
                'Crime',
                'Drama'
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Movie>>(
              future: _movies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Error: ${snapshot.error}',
                          style: TextStyle(color: Colors.white)));
                }

                List<Movie> movies = _searchController.text.isNotEmpty
                    ? _filteredMovies
                    : snapshot.data ?? [];

                if (movies.isEmpty) {
                  return const Center(
                      child: Text('No movies found',
                          style: TextStyle(color: Colors.white)));
                }

                return GridView.custom(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: const [
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(2, 2),
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 1),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      Movie movie = movies[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/images/placeholder.png');
                          },
                        ),
                      );
                    },
                    childCount: movies.length,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
