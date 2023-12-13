import 'package:flutter/material.dart';
import 'package:groccery_app/screens/Categories.dart';
import 'package:groccery_app/screens/Contact.dart';
import 'package:groccery_app/screens/Favorites.dart';
import 'package:groccery_app/screens/landing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
     LandingPage(),
    CategoriesPage(),
    ContactPage(),
    FavoritePage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Text('Good Morning',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10)),
              Text('Rafatul Islam',style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'notification',
              onPressed: () {
                // handle the press
              },
            ),
          ]),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: '',
          ),
        ],
        elevation: 10,
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.blue[800],
        iconSize: 30,
      ),
    );
  }
}
