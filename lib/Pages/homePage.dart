// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_30days/models/catelog.dart';
import 'package:flutter_30days/widgets/ItemWidget.dart';
import 'package:flutter_30days/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // ignore: non_constant_identifier_names
    final MobileData =
        await rootBundle.loadString("assets/files/MobileData.json");
    final jsonDecodedData = jsonDecode(MobileData);
    var productsData = jsonDecodedData["mobiles"];
    CatelogModel.items = List.from(productsData)
        .map<ItemClass>((item) => ItemClass.fromMap(item))
        .cast<ItemClass>()
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                // item: CatelogModel.Items[index],
                item: CatelogModel.items[index],
              );
            },
            // itemCount: //CatelogModel.Items.length,
            itemCount: CatelogModel.items.length,
          ),
        ));
  }
}
