import 'package:flutter/foundation.dart';
import 'package:flutter_30days/core/store.dart';
import 'package:flutter_30days/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

class AddMutation extends VxMutation<MyStore> {
  late final ItemClass item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id as int);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  late final ItemClass item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id as int);
  }
}
