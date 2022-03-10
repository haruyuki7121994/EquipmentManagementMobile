// import 'package:flutter/material.dart';
// import 'package:appqrcode/components/default_button.dart';
// import 'package:appqrcode/models/Product.dart';
// import 'package:appqrcode/size_config.dart';
// import 'package:appqrcode/details/components/comment.dart';
// import 'product_description.dart';
// import 'top_rounded_container.dart';
// import 'product_images.dart';
// import 'package:appqrcode/models/Equipment.dart';
//
// class Body extends StatelessWidget {
//   final Equipment equipment;
//
//   const Body({Key? key, required this.equipment}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         EquipmentImages(equipment: equipment),
//         TopRoundedContainer(
//           color: Colors.white,
//           child: Column(
//             children: [
//               ProductDescription(
//                 equipment: equipment,
//               ),
//               TopRoundedContainer(
//                 color: Color(0xFFF6F7F9),
//                 child: Column(
//                   children: [
//                     TopRoundedContainer(
//                       color: Colors.white,
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                           left: SizeConfig.screenWidth * 0.15,
//                           right: SizeConfig.screenWidth * 0.15,
//                           bottom: getProportionateScreenWidth(40),
//                           top: getProportionateScreenWidth(15),
//                         ),
//                         child: DefaultButton(
//                           text: "Comment",
//                           press: () => Navigator.pushNamed(
//                                  context,
//                                  Comment.routeName,
//                                ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
