// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../model/product_list.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key, required this.products}) : super(key: key);
  final ProductList products;

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int quantity=1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              height: size.height * 0.4,
              width: size.width,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  AssetImage(widget.products.image),
                      fit: BoxFit.cover),
                ),
              )),

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
             
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                           Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              widget.products.name,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              '\$${widget.products.price}',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                onPrimary: Colors.blue[800],
                                shadowColor: Colors.blue[800],
                                elevation: 10.0,
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(16.0)),
                            child: Text('Add to cart'),
                            onPressed: () async {},
                          ),
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
                  
                  SizedBox(height: 20,),
                  Text(widget.products.description),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          )
        ],
     
      ),
    );
  }
}
