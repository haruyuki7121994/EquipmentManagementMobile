import "package:flutter/material.dart";
import 'product_card.dart';
import 'models/Product.dart';
import 'size_config.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),

          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                ...List.generate(
                  demoProducts.length,
                      (index) {
                    if (demoProducts[index].isPopular)
                      return ProductCard(product: demoProducts[index]);

                    return SizedBox
                        .shrink(); // here by default width and height is 0
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
