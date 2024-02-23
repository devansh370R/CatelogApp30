class Item {
  final num id;
  final String name;
  final num price;
  final String url;

  Item(
      {required this.id,
      required this.name,
      required this.price,
      required this.url});
}

final Products = [
  Item(
      id: 1001,
      name: "Samsung Mobile",
      price: 30000,
      url:
          "http://c2c.sulekhalive.com/lcproducts/mobiles/images/samsung/album/large/samsung-z3(2).jpg"),
];
