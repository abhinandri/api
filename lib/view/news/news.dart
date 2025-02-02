import 'package:amazone_prime_clone/view/news/Shorts.dart';
import 'package:amazone_prime_clone/view/news/comming_soon.dart';
import 'package:amazone_prime_clone/view/news/latest_release.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 20), // Some spacing if needed
          TabBar(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[200],
            tabs: const [
              Tab(text: "Latest Releases"),
              Tab(text: "Coming Soon"),
              Tab(text: "Shorts"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                LatestReleases(),
                ComingSoon(),
                // Shorts(),
                StreamingShowClone()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
