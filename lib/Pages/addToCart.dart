import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_30days/models/cart.dart';
import 'package:flutter_30days/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final ItemClass catelog;
  const AddToCart({
    required this.catelog,
    super.key,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catelog);
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 82, 80, 80))),
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catelog = CatelogModel();
            final _cart = CartModel();
            _cart.catelog = _catelog;
            _cart.add(widget.catelog);
            setState(() {});
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
