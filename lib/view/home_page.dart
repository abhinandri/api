import 'package:amazone_prime_clone/view/costum_horzontal_listview.dart';
import 'package:amazone_prime_clone/view/custome_text_gride.dart';
import 'package:amazone_prime_clone/view/top10_language.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bannerImages = [
    'assets/images/Screenshot 2025-01-27 224255.png',
    'assets/images/Screenshot 2025-01-29 200016.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 450,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                  ),
                  items: bannerImages.map((imagePath) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
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
                  padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/Logo Alternative.png',
                        height: 50,
                        width: 50,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.cast_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),

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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 190,
                              height: 45,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[900],
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  minimumSize: const Size(120, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                label: const Text(
                                  'Watch Now',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 45,
                              width: 45,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: Colors.grey[900],
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            7,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Latest Releases',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 120,
                          height: 100,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Asianet Shows',
                  ),
                  CustomHorizontalListView(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Top 10 in india Today',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  LanguageTabs(
                    languages: [
                      'All',
                      'Hindi',
                      'English',
                      'Tamil',
                      'Telugu',
                      'Malayalam'
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomHorizontalListView(),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Popular Web Series',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomHorizontalListView()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    );
  }

  Widget _buildDot() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        '•',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
