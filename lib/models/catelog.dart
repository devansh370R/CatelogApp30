class ItemClass {
  final num id;
  final String name;
  final String desc;
  final String info;
  final num price;
  final String url;

  ItemClass(
      {required this.id,
      required this.name,
      required this.desc,
      required this.info,
      required this.price,
      required this.url});

  factory ItemClass.fromMap(Map<dynamic, dynamic> map) => ItemClass(
        id: map["id"],
        name: map["name"],
        desc: map["description"],
        info: map["info"],
        price: map["price"],
        url: map["url"],
      );
  toMap() => {
        "id": id,
        "name": name,
        "description": desc,
        "info": info,
        "price": price,
        "url": url,
      };
}

class CatelogModel {
  late CatelogModel _catelog;

  static List<ItemClass> items = [];

  ItemClass getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  ItemClass getByPosition(int pos) => items[pos];
}
