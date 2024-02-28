// ignore: file_names
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_30days/Pages/addToCart.dart';
import 'package:flutter_30days/Pages/homeDetailPage.dart';
import 'package:flutter_30days/models/cart.dart';
import 'package:flutter_30days/models/catelog.dart';
import 'package:flutter_30days/utiles/myRoutes.dart';
import 'package:flutter_30days/widgets/ItemWidget.dart';
import 'package:flutter_30days/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

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
    List<ItemClass> items = List.from(productsData)
        .map<ItemClass>((item) => ItemClass.fromMap(item))
        .cast<ItemClass>()
        .toList();
    // CatelogModel.items = List.from(productsData)
    //     .map<ItemClass>((item) => ItemClass.fromMap(item))
    //     .cast<ItemClass>()
    //     .toList();
    setState(() {
      CatelogModel.items = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartPageRoute);
        },
        backgroundColor: Color.fromARGB(255, 15, 17, 19),
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                const CatelogList().p16().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(const Color.fromARGB(255, 15, 17, 19))
            .make(),
        "Trending Products".text.xl2.color(Colors.grey).make()
      ],
    );
  }
}

class CatelogList extends StatelessWidget {
  const CatelogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catelog = CatelogModel.items[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailPage(catelog: catelog),
                ));
          },
          child: CatelogItem(
            catelog: catelog,
          ),
        );
      },
      itemCount: CatelogModel.items.length,
    );
  }
}

class CatelogItem extends StatelessWidget {
  const CatelogItem({super.key, required this.catelog});

  final ItemClass catelog;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: VxBox(
          child: Row(
        children: [
          Hero(
              tag: Key(catelog.id.toString()),
              child: CatelogImage(image: catelog.url)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catelog.name.text.bold.lg.make(),
              catelog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catelog.price}".text.bold.xl.make(),
                  AddToCart(catelog: catelog)
                ],
              )
            ],
          ))
        ],
      )).color(Colors.white).roundedLg.square(150).py12.make(),
    );
  }
}

class CatelogImage extends StatelessWidget {
  final String image;
  const CatelogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .roundedLg
        .p8
        .color(Colors.grey[100]!)
        .make()
        .p16()
        .w40(context);
  }
}
