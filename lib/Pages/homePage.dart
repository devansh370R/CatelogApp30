import 'package:flutter/material.dart';
import 'package:flutter_30days/models/catelog.dart';
import 'package:flutter_30days/widgets/ItemWidget.dart';
import 'package:flutter_30days/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List dummyList = List.generate(50, (index) => CatelogModel.Items[0]);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Application",
            style: TextStyle(color: Colors.black),
          ),
        ),
        drawer: const MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemWidget(
                //item: CatelogModel.Items[index],
                item: dummyList[index],
              );
            },
            itemCount: CatelogModel.Items.length,
          ),
        ));
  }
}
