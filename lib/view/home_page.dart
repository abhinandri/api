import 'package:amazone_prime_clone/api/api.dart';
import 'package:amazone_prime_clone/constants.dart';
import 'package:amazone_prime_clone/models/movies.dart';
import 'package:amazone_prime_clone/view/costum_horzontal_listview.dart';
import 'package:amazone_prime_clone/view/top10_language.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> latestMovies;

  late Future<List<Movie>> topRatedMovies;

    
  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    latestMovies = Api().getLatestMovies();

    topRatedMovies = Api().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 450, // Prevents overflow
                    child: FutureBuilder(
                      future: trendingMovies,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                                'There issue in fetching movies, please try again..',
                                style: const TextStyle(color: Colors.white)),
                          );
                        } else if (snapshot.hasData) {
                          return CarouselSlider(
                            options: CarouselOptions(
                              height: 450,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 1.0,
                            ),
                            items: snapshot.data!.map<Widget>((movie) {
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${AppApi.imagePath}${movie.posterPath}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),

                  // Gradient Overlay
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                          Colors.black
                        ],
                      ),
                    ),
                  ),

                  // Top Bar with Logo and Cast Icon
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/Logo Alternative.png',
                          height: 50,
                          width: 50,
                        ),
                        const Spacer(),
                        const Icon(Icons.cast_rounded, color: Colors.white),
                      ],
                    ),
                  ),

                  // Bottom Section: Categories and Buttons
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          // Categories Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCategory('Tamil'),
                              _buildDot(),
                              _buildCategory('Reality'),
                              _buildDot(),
                              _buildCategory('Competition'),
                              _buildDot(),
                              _buildCategory('Inspirational'),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Watch Now & Add Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 190,
                                height: 45,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.play_arrow,
                                      color: Colors.white, size: 20),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[900],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  label: const Text('Watch Now',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 45,
                                width: 45,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[900],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Icon(Icons.add,
                                      color: Colors.white, size: 24),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          // Dots Indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              7,
                              (index) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == 0
                                      ? Colors.white
                                      : Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Latest Releases Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: latestMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'There issue in fetching movies, please try again..',
                                style: const TextStyle(color: Colors.white)));
                      } else if (snapshot.hasData) {
                        return ListSection(
                          moviesfuture: trendingMovies,
                          title: 'Latest Releases',
                          itemHeight: 150,
                          itemWidth: 120,
                          itemCount: 12,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  // LanguageTabs(languages: [
                  //   'All',
                  //   'Hindi',
                  //   'English',
                  //   'Tamil',
                  //   'Telugu',
                  //   'Malayalam'
                  // ]),
                  const SizedBox(height: 10),
                  ListSection(
                    moviesfuture: latestMovies,
                    title: 'Trending Show',
                    itemHeight: 150,
                    itemWidth: 120,
                    itemCount: 12,
                  ),
                  const SizedBox(height: 20),
                  ListSection(
                    moviesfuture: topRatedMovies,
                    title: 'Top Rated Movies',
                    itemHeight: 150,
                    itemWidth: 120,
                    itemCount: 12,
                    languageTabs: const LanguageTabs(languages: [
                      'All',
                      'Hindi',
                      'English',
                      'Tamil',
                      'Telugu',
                      'Malayalam'
                    ]),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String text) {
    return Text(text,
        style: const TextStyle(color: Colors.white, fontSize: 14));
  }

  Widget _buildDot() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text('•', style: TextStyle(color: Colors.white, fontSize: 14)),
    );
  }
}
