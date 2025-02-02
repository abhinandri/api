import 'package:amazone_prime_clone/view/downloads/downloads.dart';
import 'package:amazone_prime_clone/view/home_page.dart';
import 'package:amazone_prime_clone/view/news/news.dart';
import 'package:amazone_prime_clone/view/search_page/search.dart';
import 'package:flutter/material.dart';

class Bottom_navigation extends StatefulWidget {
  const Bottom_navigation({super.key});

  @override
  State<Bottom_navigation> createState() => _HomepageState();
}

class _HomepageState extends State<Bottom_navigation> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    Search(),
    News(),
    Downloads(),
    Center(
      child: Text('My Space'),
    )
  ];

  void onitem_tapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onitem_tapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), label: 'New&Hot'),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: 'Download'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My Space')
        ],
      ),
    );
  }
}
