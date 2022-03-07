import "package:flutter/material.dart";
import 'product_card.dart';
import 'models/Product.dart';
import 'size_config.dart';
import 'package:appqrcode/components/history_app_bar.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          constraints: BoxConstraints(
            maxWidth: 632,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              ),
              HistoryAppBar(),
              SizedBox(height: getProportionateScreenWidth(20)),
              SingleChildScrollView(

                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ...List.generate(
                    //   demoProducts.length,
                    //       (index) {
                    //     if (demoProducts[index].isPopular)
                    //       return ProductCard(product: demoProducts[index]);
                    //
                    //     return SizedBox
                    //         .shrink(); // here by default width and height is 0
                    //   },
                    // ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
