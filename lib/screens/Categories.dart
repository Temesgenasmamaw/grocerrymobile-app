import 'package:flutter/material.dart';
import 'package:groccery_app/model/category_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('category'),backgroundColor: Colors.greenAccent,),
        body:  GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: dummyCategorys.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildCategoryCard( dummyCategorys[index]);
        },
      ));
  }

  Widget _buildCategoryCard(Category category) {
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(child: Image.asset(category.image)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category.name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
