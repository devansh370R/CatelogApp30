import 'package:flutter_30days/models/catelog.dart';

class CartModel {
  late CatelogModel _catelog;
  final List<int> _itemIds = [];

  CatelogModel get catelog => _catelog;

  set catelog(CatelogModel newCatelogModel) {
    assert(newCatelogModel != null);
    _catelog = newCatelogModel;
  }

  Iterable<ItemClass> get items =>
      _itemIds.map((id) => _catelog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0.0, (total, current) => total + current.price);

  void add(ItemClass item) {
    final List<num> _itemIds = [];
    _itemIds.add(item.id);
  }

  void remove(ItemClass item) {
    final List<num> _itemIds = [];
    _itemIds.remove(item.id);
  }
}
