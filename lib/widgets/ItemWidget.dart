import 'package:flutter/material.dart';
import 'package:flutter_30days/models/catelog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});
  final ItemClass item;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(
          item.url,
          fit: BoxFit.cover,
        ),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toString()}",
          textScaleFactor: 1.5,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
