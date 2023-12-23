import 'package:flutter/material.dart';

import 'home.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thank You',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: ListView(
              padding: const EdgeInsets.all(16.0),
        children: [
          // Image.asset('assets/food-delivery.jpg',width: 300,height: 400,),
          Image.network(
            'https://builtin.com/sites/www.builtin.com/files/styles/og/public/food-delivery-companies.jpg',
            // width: 300,
            //height: 300,
            fit: BoxFit.cover,
          ),
      SizedBox(height: 20,),
          Center(
            child: Text(
              'Your order in process',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          Center(
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod'),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage(title: '');
                }));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                'GO BACK HOME',
              ),
            ),
          ),
        ],
      )),
    );
  }
}
