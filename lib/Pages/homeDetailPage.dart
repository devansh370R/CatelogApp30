import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_30days/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final ItemClass catelog;
  const HomeDetailPage({super.key, required this.catelog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catelog.price}".text.bold.xl3.color(Colors.blue).make(),
          ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 82, 80, 80))),
                  onPressed: () {},
                  child: "Buy".text.color(Colors.white).make())
              .wh(150, 40)
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            children: [
              Hero(
                child: Image.network(catelog.url),
                tag: Key(catelog.id.toString()),
              ).h32(context),
              Expanded(
                  child: VxArc(
                edge: VxEdge.top,
                arcType: VxArcType.convey,
                height: 30.0,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      catelog.name.text.bold.xl3.make(),
                      catelog.desc.text.textStyle(context.captionStyle).make(),
                      10.heightBox,
                    ],
                  ).py32(),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
