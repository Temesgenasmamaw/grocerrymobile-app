class ProductList {
  ProductList({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
  });

  String id;
  String image;
  String name;
  double price;
  String category;
  String description;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
      id: json["id"],
      image: json["image"],
      name: json["name"],
      price: json["price"],
      category: json["category"],
      description: json["description"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "category": category,
        "description": description,
      };
}

final List<ProductList> dummyProductLists = [
  ProductList(
    id: '1',
    image: 'assets/2.png',
    name: 'Orange',
    price: 15.0,
    category: 'Fruits',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  ProductList(
    id: '2',
    image: 'assets/1.png',
    name: 'Apple',
    price: 20.5,
    category: 'vegetables',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  ProductList(
    id: '3',
    image: 'assets/4.png',
    name: 'Papper',
    price: 10.98,
    category: 'MUSHROOM',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  ProductList(
    id: '4',
    image: 'assets/5.png',
    name: 'Tomato',
    price: 12,
    category: 'vegetables #4',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
];
