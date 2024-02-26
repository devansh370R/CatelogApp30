class ItemClass {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String url;

  ItemClass(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.url});

  factory ItemClass.fromMap(Map<dynamic, dynamic> map) => ItemClass(
        id: map["id"],
        name: map["name"],
        desc: map["description"],
        price: map["price"],
        url: map["url"],
      );
  toMap() => {
        "id": id,
        "name": name,
        "description": desc,
        "price": price,
        "url": url,
      };
}

class CatelogModel {
  // ignore: non_constant_identifier_names
  static List<ItemClass> items = [
    ItemClass(
        id: 1001,
        name: "Samsung Mobile",
        desc: "High-performance Samsung mobile with advanced features.",
        price: 30000,
        url:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSb7M3IzK1MqEKG-_7XVR0gXhMe85u99O6xi6ww0w34N6REFveYcbKM3935Ap_yPNVgwF0&usqp=CAU"),
  ];
}
