import 'package:flutter/widgets.dart';
import 'package:appqrcode/details/details_screen.dart';
import 'package:appqrcode/welcome.dart';
import 'package:appqrcode/details/components/comment.dart';


final Map<String, WidgetBuilder> routes = {
  WelcomePage.routeName: (context) => WelcomePage(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  Comment.routeName: (context) => Comment(),
};