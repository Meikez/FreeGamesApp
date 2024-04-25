

import 'package:flutter/material.dart';
import 'package:marvel_pedia/pages/favorites.dart';

import 'package:marvel_pedia/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final int? pageTo;
  const MyApp({super.key, this.pageTo});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPage = 0;

  @override
  void initState() {
  super.initState();
  if (widget.pageTo != null) {
      _currentPage = widget.pageTo!;
    }
  }

  final List<Widget> _screens = const [
    HomePage(),
    FavoritesPage(),
  ];

  void _changePage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _screens[_currentPage],
        // body: const FavoritesPage(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            _changePage(value);
          },
          currentIndex: _currentPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorites")
          ],
        ),
      ),
    );
  }
}
