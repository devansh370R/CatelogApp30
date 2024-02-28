import 'package:flutter/foundation.dart';
import 'package:flutter_30days/models/catelog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;
  late CatelogModel _catelog;
  final List<int> _itemIds = [];

  CatelogModel get catelog => _catelog;

  set catelog(CatelogModel newCatelogModel) {
    assert(newCatelogModel != null);
    _catelog = newCatelogModel;
  }

  Iterable<ItemClass> get items {
    return _itemIds.map((id) => _catelog.getById(id)).toList();
  }

  num get totalPrice =>
      items.fold(0.0, (total, current) => total + current.price);

  void add(ItemClass item) {
    _itemIds.add(item.id as int);
  }

  void remove(ItemClass item) {
    _itemIds.remove(item.id);
  }
}
