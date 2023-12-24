import 'package:flutter/material.dart';

import '../model/product_list.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: GridView.builder(
            itemCount: dummyProductLists.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 160,
            ),
            itemBuilder: (context, index) {
              final product = dummyProductLists[index];
              return GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return DetailPage(products: product);
                  // }));
                },
                child: Container(
                  width: 138.74,
                  height: 138.74,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFAFAFA),
                    shape: RoundedRectangleBorder(
                      // side: BorderSide(width: 1, color: Color(0xFFFF2D6C)),
                      borderRadius: BorderRadius.circular(28.32),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x42000000),
                        blurRadius: 19,
                        offset: Offset(9, 0),
                        spreadRadius: 2,
                      )
                    ],
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
                            padding: const EdgeInsets.only(left: 26.0),
                            child: Text(
                              product.category,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
