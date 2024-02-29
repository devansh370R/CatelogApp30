import 'package:flutter/material.dart';
import 'package:flutter_30days/core/store.dart';
import 'package:flutter_30days/models/cart.dart';
import 'package:flutter_30days/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: "Cart".text.make()),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
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
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: (context, dynamic _, VxStatus? status) =>
                "\$${_cart.totalPrice}".text.xl4.make(),
            mutations: {RemoveMutation},
            notifications: {},
          ),
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

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    final Iterable<ItemClass> cartItems = _cart.items;

    return _cart.items.isEmpty
        ? "Nothing To Show".text.xl3.makeCentered()
        : ListView.builder(
            itemBuilder: (context, index) {
              final cartItems = _cart.items.toList();
              return ListTile(
                title: cartItems[index].name.text.make(),
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline_outlined),
                  onPressed: () {
                    RemoveMutation(_cart.items.elementAt(index));
                  },
                ),
              );
            },
            itemCount: _cart.items.length,
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
