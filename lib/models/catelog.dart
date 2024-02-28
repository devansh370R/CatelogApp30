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
  static List<ItemClass> items = [];

  ItemClass getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  ItemClass getByPosition(int pos) => items[pos];
}
