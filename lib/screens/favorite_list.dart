import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:groccery_app/bloc/add_to_favorite/add_to_favorite_bloc.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite\'s',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
              if (state.favoriteItems.isEmpty) {
                return Center(
                  heightFactor: 13.8,
                  child: Text(
                    'Your Favorites is empty',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height *
                      0.6, // Set a fixed height or use constraints
                  child: ListView.builder(
                    itemCount: state.favoriteItems.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.asset(
                                  state.favoriteItems[index].image,
                                  width: 93,
                                  height: 113,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      state.favoriteItems[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      '\$${state.favoriteItems[index].price}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orangeAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    IconButton(
                                      // state.favoriteItems[index].name,

                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_border_outlined,
                                          color: Colors.red),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Add to cart'),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
