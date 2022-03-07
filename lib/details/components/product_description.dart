import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appqrcode/models/Product.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:appqrcode/models/Equipment.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.equipment,

  }) : super(key: key);

  final Equipment equipment;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            equipment.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            equipment.qrcode,
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: getProportionateScreenWidth(20),
        //     vertical: 10,
        //   ),
        //   child: GestureDetector(
        //     onTap: () => Navigator.pushNamed(
        //       context,
        //       Comment.routeName,
        //     ),
        //     child: Row(
        //       children: [
        //         Text(
        //           "Comment",
        //           style: TextStyle(
        //               fontWeight: FontWeight.w600, color: kPrimaryColor),
        //         ),
        //         SizedBox(width: 5),
        //         Icon(
        //           Icons.arrow_forward_ios,
        //           size: 12,
        //           color: kPrimaryColor,
        //         ),
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }
}
