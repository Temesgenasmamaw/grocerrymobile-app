import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groccery_app/bloc/add_to_cart/add_to_cart_bloc.dart';

import 'thankyou.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({Key? key}) : super(key: key);

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  double totalPrice = 0;
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    //  const style=TextStyle(fontWeight: FontWeight.bold,fontSize:16);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Item details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              if (state.cartItems.isEmpty) {
                return Center(
                  heightFactor: 13.8,
                  child: Text(
                    'Your cart is empty',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      totalPrice = totalPrice + state.cartItems[index].price *quantity;
                      return Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.asset(
                                  state.cartItems[index].image,
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
                                    Text(state.cartItems[index].category
                                        .toUpperCase()),
                                    Text(
                                      state.cartItems[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      '\$${state.cartItems[index].price}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orangeAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                margin: EdgeInsets.only(top: 40),
                                child: Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                            setState(() {
                                            quantity = quantity -1;
                                          });
                                        },
                                        icon: Icon(Icons.remove),
                                      ),
                                      Text('${quantity}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity = quantity + 1;
                                          });
                                        },
                                        icon: Icon(Icons.add),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          final _cartBloc =
                                              BlocProvider.of<CartBloc>(
                                                  context);
                                          _cartBloc.add(RemoveFromCartEvent(
                                              state.cartItems[index]));
                                        },
                                        icon: Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                               
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 26),
                        ],
                      );
                    },
                  ),
                );
              }
            }),
            MySeparator(
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(' Total',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                  ' \$100',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                 Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ThankYouScreen();
                      }));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                'PLACE ORDER',
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
