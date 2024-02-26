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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
              itemBuilder: (context, index) {
                final item = CatelogModel.items[index];
                return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: GridTile(
                      child: Image.network(item.url),
                      header: Container(
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      footer: Container(
                        child: Text(
                          item.price.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.black),
                      ),
                    ));
              },
              itemCount: CatelogModel.items.length,
            )));
  }
}
