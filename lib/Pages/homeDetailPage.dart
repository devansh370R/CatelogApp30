import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_30days/Pages/addToCart.dart';
import 'package:flutter_30days/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final ItemClass catelog;
  const HomeDetailPage({super.key, required this.catelog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catelog.price}".text.bold.xl3.color(Colors.blue).make(),
          AddToCart(
            catelog: catelog,
          ).wh(150, 40)
        ],
      ).p32(),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            children: [
              // backgroundColor(Colors.grey),
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
                      "Apple mobile devices, such as the iPhone and iPad, are known for their premium design, seamless integration, and user-friendly experience. Powered by the iOS operating system, these devices feature a high-performance A-series chip, advanced camera systems, and biometric authentication (Touch ID or Face ID). Apple's commitment to accessibility, sustainability, and constant innovation makes their mobile devices a popular choice for a comprehensive and cohesive digital experience."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
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
