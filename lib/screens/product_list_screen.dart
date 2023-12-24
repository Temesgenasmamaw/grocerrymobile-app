import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groccery_app/bloc/add_to_cart/add_to_cart_bloc.dart';
import 'package:groccery_app/pages/detail.dart';
import '../bloc/add_to_favorite/add_to_favorite_bloc.dart';
import '../model/product_list.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning',
            style: TextStyle(
              color: Color(0xFF5E5E5E),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rafatul Islam',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Container(
                width: 24,
                height: 24,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Stack(children: [
                  Icon(Icons.notifications),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFDC44B),
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFFFAFEFC),
                        ),
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Categories', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10), // Adjusted height
            categories(),
            SizedBox(height: 10),
            Text('Latest Products',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Expanded(
              child: GridView.builder(
                itemCount: dummyProductLists.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4, // Adjust the spacing as needed
                  crossAxisSpacing: 8, // Adjust the spacing as needed
                  mainAxisExtent: 160,
                ),
                itemBuilder: (context, index) {
                  final product = dummyProductLists[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailPage(products: product);
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x42000000),
                            blurRadius: 19,
                            offset: Offset(9, 0),
                            spreadRadius: 2,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(120),
                                  child: Image.asset(
                                    product.image,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),

                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),

                              // const SizedBox(height: 4),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, bottom: 0),
                                child: Text(
                                  '\$${product.price}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 6,
                            left: 6,
                            child: BlocBuilder<FavoriteBloc, FavoriteState>(
                              builder: (context, state) {
                                final isFavorite = state.favoriteItems
                                    .any((item) => item.id == product.id);
                                return IconButton(
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border_rounded,
                                    color:
                                        isFavorite ? Colors.red : Colors.black,
                                  ),
                                  onPressed: () {
                                    final favoriteBloc =
                                        context.read<FavoriteBloc>();
                                    if (isFavorite) {
                                      favoriteBloc.add(
                                          RemoveFromFavoriteEvent(product));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Item removed from favorite'),
                                          duration: Duration(seconds: 3),
                                        ),
                                      );
                                    } else {
                                      favoriteBloc
                                          .add(AddToFavoriteEvent(product));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Item added to favorite'),
                                          duration: Duration(seconds: 3),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: () {
                                final cartBloc = context.read<CartBloc>();
                                final cartItems = cartBloc.state.cartItems;
                                if (cartItems
                                    .any((item) => item.id == product.id)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Item already addeded to cart'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                } else {
                                  cartBloc.add(AddToCartEvent(product));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Item is added to cart'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                }
                              },
                              child: Material(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Add to cart',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
      height: 100, // Increase the height to give it more space
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            imagePaths.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    width: 93,
                    height: 73,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x42000000),
                          blurRadius: 19,
                          offset: Offset(9, 0),
                          spreadRadius: 2,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        imagePaths[index],
                        width: 70, // Set the desired width of each image
                        height: 60, // Set the desired height of each image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
