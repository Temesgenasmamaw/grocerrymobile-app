import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groccery_app/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:groccery_app/model/product_list.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.products}) : super(key: key);
  final ProductList products;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              height: size.height * 0.4,
              width: size.width,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.products.image),
                      fit: BoxFit.cover),
                ),
              )),
          Positioned(
            top: 2,
            left: 2,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          Positioned(
            top: size.height * 0.35,
            height: size.height * 0.65,
            width: size.width,
            child: Container(
              // color: Colors.white,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36.0),
                      topRight: Radius.circular(36.0))),

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Text(
                                widget.products.name,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Text(
                                '\$${widget.products.price}',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 60,
                          height: 10,
                        ),
                        Column(
                          children: [
                            ButtonTheme(
                              height: 50.0, // Set the height as needed
                              child: ElevatedButton(
                                onPressed: () {
                                  final cartBloc = context.read<CartBloc>();
                                  final cartItems = cartBloc.state.cartItems;
                                  if (cartItems.any((item) =>
                                      item.id == widget.products.id)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Item has already addeded'),
                                            duration: Duration(seconds: 3)));
                                  } else {
                                    cartBloc
                                        .add(AddToCartEvent(widget.products));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Item is added to the cart'),
                                            duration: Duration(seconds: 3)));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .orangeAccent, // Set your background color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set your border radius
                                  ),
                                ),
                                child: Text('Add to cart'),
                              ),
                            ),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //       backgroundColor: Colors.orangeAccent,
                            //       elevation: 10.0,
                            //       shape: const CircleBorder(),
                            //       padding: const EdgeInsets.all(16.0)),
                            //   child: Text('Add to cart'),
                            //   onPressed: () async {
                            //     final cartBloc = context.read<CartBloc>();
                            //     final cartItems = cartBloc.state.cartItems;
                            //     if (cartItems.any(
                            //         (item) => item.id == widget.products.id)) {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //           const SnackBar(
                            //               content: Text(
                            //                   'Item already addeded to cart'),
                            //               duration: Duration(seconds: 3)));
                            //     } else {
                            //       cartBloc.add(AddToCartEvent(widget.products));
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //           const SnackBar(
                            //               content:
                            //                   Text('Item is added to cart'),
                            //               duration: Duration(seconds: 3)));
                            //     }
                            //   },
                            // ),

                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        quantity = quantity - 1;
                                      });
                                    },
                                    icon: Icon(Icons.remove),
                                    color: Colors.orangeAccent,
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
                                    color: Colors.orangeAccent,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors
                                  .orangeAccent, // Optional: set the underline color
                              decorationThickness: 4.0,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.products.description,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget details() {
  //   return Positioned(
  //     bottom: 0,
  //     left: 0,
  //     right: 0,
  //     child: Container(
  //       color: Colors.white,
  //       padding: const EdgeInsets.symmetric(horizontal: 16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Text(
  //                           widget.products.name,
  //                           style: const TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.black,
  //                             fontSize: 20,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: 13),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                           '\$${widget.products.price}',
  //                           style: const TextStyle(
  //                             fontSize: 16,
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.orangeAccent,
  //                           ),
  //                         ),
  //                         Row(
  //                           children: [
  //                             IconButton(
  //                               onPressed: () {
  //                                 setState(() {
  //                                   quantity = quantity - 1;
  //                                 });
  //                               },
  //                               icon: Icon(Icons.remove),
  //                               color: Colors.orangeAccent,
  //                             ),
  //                             Text('${quantity}',
  //                                 style: TextStyle(
  //                                     fontWeight: FontWeight.bold,
  //                                     fontSize: 20)),
  //                             IconButton(
  //                               onPressed: () {
  //                                 setState(() {
  //                                   quantity = quantity + 1;
  //                                 });
  //                               },
  //                               icon: Icon(Icons.add),
  //                               color: Colors.orangeAccent,
  //                             ),
  //                           ],
  //                         ),

  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 25,
  //                 height: 50,
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {
  //           final cartBloc = context.read<CartBloc>();
  //                         final cartItems = cartBloc.state.cartItems;
  //                         if (cartItems.any((item) => item.id == widget.products.id)) {
  //                           ScaffoldMessenger.of(context).showSnackBar(
  //                               const SnackBar(
  //                                   content:
  //                                       Text('Item already addeded to cart'),
  //                                   duration: Duration(seconds: 3)));
  //                         } else {
  //                           cartBloc.add(AddToCartEvent(widget.products));
  //                           ScaffoldMessenger.of(context).showSnackBar(
  //                               const SnackBar(
  //                                   content: Text('Item is added to cart'),
  //                                   duration: Duration(seconds: 3)));
  //                         }
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Colors.orangeAccent,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10.0),
  //                   ),
  //                 ),
  //                 child: Text('Add to cart'),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 30),
  //           Text(
  //             'Description',
  //             style: Theme.of(context).textTheme.titleLarge!.copyWith(
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //           ),
  //           const SizedBox(height: 16),
  //           Text(
  //             widget.products.description,
  //             style: const TextStyle(
  //               fontSize: 16,
  //               color: Colors.black54,
  //             ),
  //           ),
  //           const SizedBox(height: 30),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // SizedBox image() {
  //   return SizedBox(

  //     height: 500,
  //     child: Stack(
  //       children: [
  //         Positioned(
  //           left: 0,
  //           bottom: 0,
  //           right: 0,
  //           child: Container(
  //             height: 150,
  //             decoration: const BoxDecoration(
  //               color: Color.fromARGB(255, 151, 147, 147),
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(30),
  //                 topRight: Radius.circular(30),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Center(
  //           child: Container(

  //             child: ClipRRect(

  //               child: Image.asset(
  //                 widget.products.image,
  //                 fit: BoxFit.cover,
  //                 width: 500,
  //                 height: 400,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget header() {
  //   return AppBar(
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     leading: IconButton(
  //       icon: Icon(Icons.arrow_back, color: Colors.black),
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //     ),
  //     actions: [
  //       Material(
  //         color: Colors.white.withOpacity(0.3),
  //         borderRadius: BorderRadius.circular(8),
  //         child: InkWell(
  //           onTap: () {},
  //           borderRadius: BorderRadius.circular(15),
  //           child: Container(
  //             height: 40,
  //             width: 40,
  //             alignment: Alignment.center,
  //             child: const Icon(Icons.favorite_border, color: Colors.orangeAccent),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
