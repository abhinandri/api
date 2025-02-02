import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:amazone_prime_clone/view/costum_horzontal_listview.dart';
import 'package:amazone_prime_clone/view/custome_text_gride.dart';
import 'package:amazone_prime_clone/view/top10_language.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
              onChanged: (value) => changed(value),
              decoration: InputDecoration(
                hintText: "Search for 'cricket'",
                hintStyle: const TextStyle(fontSize: 16, color: Colors.black),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                  size: 28,
                ),
                suffixIcon: const Icon(
                  Icons.mic_none_outlined,
                  color: Colors.black,
                  size: 28,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: 'Trending in',
              ),
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

          // **GridView must be inside Expanded**
          Expanded(
            child: GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 3, // 3 columns
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(2, 2), // Bigger box
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  decoration: BoxDecoration(
                    color: (index % 2 == 0) ? Colors.blue : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                ),
                childCount: 30, // Number of dummy items
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> changed(String value) async {
    log('changed something !! $value');
  }
}
