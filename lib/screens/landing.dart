import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/product.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late SharedPreferences _prefs;
  int indexCategory = 0;
  List<String> _favoriteItems = []; // Add this line

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadFavorite(); // Add this line
  }

  void _loadFavorite() {
    final List<String>? favoriteItems = _prefs.getStringList('favorites');
    if (favoriteItems != null) {
      setState(() {
        _favoriteItems = favoriteItems;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Good Morning',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10)),
            Text(
              'Rafatul Islam',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text('Categories', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          categories(),
          SizedBox(
            height: 20,
          ),
          Text('Latest Products',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          // Expanded(
          //   child: gridFood(),
          // ),
        ],
      ),
    );
  }

  Widget categories() {

   final List<String> imagePaths = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/6.png',
  ];
    return SizedBox(
      height: 80,
         child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePaths[index],
              width: 100, // Set the desired width of each image
              height: 100, // Set the desired height of each image
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  // Widget gridFood() {
  //   return GridView.builder(
  //     itemCount: Product.dummyProducts.length,
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     padding: const EdgeInsets.all(16),
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       mainAxisSpacing: 8,
  //       crossAxisSpacing: 8,
  //       mainAxisExtent: 200,
  //     ),
  //     itemBuilder: (context, index) {
  //       // Food food = dummyFoods[index];
  //       Product products=ProductList.dummyProductLists[index];
  //       return GestureDetector(
  //         onTap: () {
  //           Navigator.push(context, MaterialPageRoute(builder: (context) {
  //             return DetailPage(products: products);
  //           }));
  //         },
  //         child: Container(
  //           height: 261,
  //           decoration: BoxDecoration(
  //             color: Colors.grey[200],
  //             borderRadius: BorderRadius.circular(16),
  //           ),
  //           child: Stack(
  //             children: [
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   const SizedBox(height: 16),
  //                   Center(
  //                     child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(120),
  //                       child: Image.network(
  //                         products.image,
  //                         width: 50,
  //                         height: 50,
  //                         fit: BoxFit.cover,
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 12),
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 16),
  //                     child: Text(
  //                       products.name,
  //                       textAlign: TextAlign.center,
  //                       maxLines: 1,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 3),
                   
  //                   Padding(
  //                     padding: const EdgeInsets.all(16),
  //                     child: Text(
  //                       '\$${products.price}',
  //                       style: const TextStyle(
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 16,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Positioned(
  //                 top: 12,
  //                 left: 12,
  //                 child: IconButton(
  //                   icon: Icon(
  //                     _favoriteItems.contains(products.name)
  //                         ? Icons.favorite
  //                         : Icons.favorite_border_rounded,
  //                     color: Colors.red, // Customize the color as needed
  //                   ),
  //                   onPressed: () {
  //                     _toggleFavorite(products);
  //                   },
  //                 ),
  //               ),
  //               Align(
  //                 alignment: Alignment.bottomRight,
  //                 child: InkWell(
  //                   onTap: () {
  //                     // _addToCart(food);
  //                     // CartPage(_addToCart(food));
  //                   },
  //                   child: Material(
  //                     color: Colors.transparent,
  //                     child: Padding(
  //                       padding: EdgeInsets.all(8),
  //                       child: Text(
  //                         'Add to cart',
  //                         style: TextStyle(color: Colors.red),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
      
  //     },
  //   );
  // }

  // void _addToCart(Food food) {
  //   List<String> cartItems = _prefs.getStringList('cart') ?? [];
  //   cartItems.add(food.name);
  //   _prefs.setStringList('cart', cartItems);
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('${food.name} added to the cart'),
  //     ),
  //   );

  //   // Pass the updated cart items to CartPage
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => CartPage(cartItems: cartItems),
  //     ),
  //   );
  // }

  void _toggleFavorite(Product products) {
    List<String> favoriteItems = _prefs.getStringList('favorites') ?? [];

    if (favoriteItems.contains(products.name)) {
      favoriteItems.remove(products.name);
    } else {
      favoriteItems.add(products.name);
      // favoriteItems.add(products.image);
    }

    _prefs.setStringList('favorites', favoriteItems);
    setState(() {
      _favoriteItems = favoriteItems;
    });
  }

}
