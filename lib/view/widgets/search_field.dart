import 'dart:async';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _onSearchChanged();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      String searchTerm = _searchController.text;
      // ignore: avoid_print
      print('Searching for: $searchTerm');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => _onSearchChanged,
      controller: _searchController,
      decoration: InputDecoration(
        hintText: "Search for 'Movie'",
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
