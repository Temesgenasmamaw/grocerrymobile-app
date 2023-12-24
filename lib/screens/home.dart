import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groccery_app/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:groccery_app/screens/cart_list.dart';

import 'Contact.dart';
import 'categories_list.dart';
import 'favorite_list.dart';
import 'product_list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    ProductListScreen(),
    CategoryListScreen(),
    CartListScreen(),
    FavoriteListScreen(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: BlocBuilder<CartBloc, CartState>(
                builder: (BuildContext context, CartState state) {
                  int count = state.cartItems.length;
                  return Stack(
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      Positioned(
                          top: 0,
                          right: 0,
                          //  bottom: 16,
                          child: Stack(children: [
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              constraints: BoxConstraints(
                                minHeight: 10,
                                minWidth: 9,
                              ),
                              child: Text(
                                '${count}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]))
                    ],
                  );
                },
              ),
              label: ''),
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
        selectedItemColor: Colors.orangeAccent,
        iconSize: 30,
      ),
    );
  }
}
