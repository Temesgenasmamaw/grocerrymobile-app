import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Page'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('example@example.com'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
            subtitle: Text('+1 123-456-7890'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Address'),
            subtitle: Text('123 Main St, City, Country'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
