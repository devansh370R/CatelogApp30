import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_30days/core/store.dart';
import 'package:flutter_30days/models/cart.dart';
import 'package:flutter_30days/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final ItemClass catelog;
  AddToCart({
    required this.catelog,
    super.key,
  });

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catelog);
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 82, 80, 80))),
        onPressed: () {
          if (!isInCart) {
            AddMutation(catelog);
            // setState(() {});
          }
        },
        child: isInCart
            ? const Icon(
                Icons.done,
                color: Colors.white,
              )
            : Icon(
                CupertinoIcons.cart_badge_plus,
                color: Colors.white,
              ));
  }
}
