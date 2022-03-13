import 'package:appqrcode/details/EquipmentDetails.dart';
import 'package:appqrcode/services/EquipmentService.dart';
import 'package:flutter/widgets.dart';
import 'package:appqrcode/welcome.dart';
import 'package:appqrcode/details/components/comment.dart';
import 'package:appqrcode/details/EquipmentDetails.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomePage.routeName: (context) => WelcomePage(),
  //Comment.routeName: (context) => Comment(),
  //EquipmentDetail.routeName: (context) => EquipmentDetail(),
};