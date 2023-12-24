import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:groccery_app/bloc/add_to_favorite/add_to_favorite_bloc.dart';

import '../bloc/add_to_cart/add_to_cart_bloc.dart';
import '../model/product_list.dart';

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
        automaticallyImplyLeading: false,
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
                      final product = dummyProductLists[index];
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
                                width: 6,
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
                              Column(
                                children: [
                                  IconButton(
                              
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite,
                                        color: Colors.red),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      final cartBloc =
                                          context.read<CartBloc>();
                                      final cartItems =
                                          cartBloc.state.cartItems;
                                      if (cartItems.any(
                                          (item) => item.id == product.id)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Item already addeded to cart'),
                                            duration: Duration(seconds: 3),
                                          ),
                                        );
                                      } else {
                                        cartBloc.add(AddToCartEvent(product));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Item is added to cart'),
                                            duration: Duration(seconds: 3),
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 167, 165, 161), // Set your background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Set your border radius
                                      ),
                                    ),
                                    child: Text('Add to cart'),
                                  ),
                                ],
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
