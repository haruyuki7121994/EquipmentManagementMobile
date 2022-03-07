// import 'package:flutter/material.dart';
// import 'package:appqrcode/models/Product.dart';
// import 'package:appqrcode/models/Equipment.dart';
// import '../../../constants.dart';
// import '../../../size_config.dart';
//
// class EquipmentImages extends StatefulWidget {
//   const EquipmentImages({
//     Key? key,
//     required this.equipment,
//   }) : super(key: key);
//
//   final Equipment equipment;
//
//   @override
//   _EquipmentImagesState createState() => _EquipmentImagesState();
// }
//
// class _EquipmentImagesState extends State<EquipmentImages> {
//
//   int selectedImage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: getProportionateScreenWidth(238),
//           child: AspectRatio(
//             aspectRatio: 1,
//             child: Hero(
//               tag: widget.equipment.id.toString(),
//               child: Image.asset(widget.equipment.images!.path[selectedImage],
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         // SizedBox(height: getProportionateScreenWidth(20)),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ...List.generate(widget.equipment.images!.length,
//                 (index) => buildSmallProductPreview(index)),
//           ],
//         )
//       ],
//     );
//   }
//
//   GestureDetector buildSmallProductPreview(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedImage = index;
//         });
//       },
//       child: AnimatedContainer(
//         duration: defaultDuration,
//         margin: EdgeInsets.only(right: 15),
//         padding: EdgeInsets.all(8),
//         height: getProportionateScreenWidth(48),
//         width: getProportionateScreenWidth(48),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//               color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
//         ),
//         child: Image.network(widget.equipment.images!.path[index]),
//       ),
//     );
//   }
// }
