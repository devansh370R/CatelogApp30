import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_30days/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: "Cart".text.make()),
      ),
      body: Column(
        children: [
          const _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}".text.xl4.make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not suppored".text.make()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 82, 80, 80))),
            child: "Buy".text.color(Colors.white).make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    final cartItems = _cart.items;
    return ListView.builder(
      itemBuilder: (context, index) {
        final cartItems = _cart.items.toList();
        return ListTile(
          title: cartItems[index].name.text.make(),
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline_outlined),
            onPressed: () {},
          ),
        );
      },
      itemCount: _cart.items?.length ?? 0,
    );
    // return ListView.builder(
    //   itemBuilder: (context, index) {
    //     final cartItems = _cart.items.toList();
    //     return ListTile(
    //       leading: const Icon(Icons.done),
    //       trailing: IconButton(
    //         icon: const Icon(Icons.remove_circle_outline),
    //         onPressed: () {},
    //       ),
    //       title: cartItems[index].name.text.make(),
    //     );
    //   },
    //   itemCount: _cart.items?.length ?? 0,
    // );
  }
}
