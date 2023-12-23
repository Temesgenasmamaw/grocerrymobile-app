import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late SharedPreferences _prefs;
  List<String> _favoriteItems = [];

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadFavorites();
  }

  void _loadFavorites() {
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
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: _favoriteItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              _favoriteItems[index],
            ),
            title: Text(_favoriteItems[index]),
          );
        },
      ),
    );
  }
}
