import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name, qrcode;
  final List<String> images;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    this.isFavourite = false,
    this.isPopular = false,
    required this.name,
    required this.qrcode,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/bench_scale1.jpeg",
      "assets/images/bench_scale2.jpeg",
      "assets/images/bench_scale3.jpeg",
    ],

    name: "Scale S100™",

    qrcode: description,

    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/scale 700ct.png",
    ],

    name: "Lab Scale F150",

    qrcode: description,

    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/scale_1.png",
    ],

    name: "Lab Scale S200",

    qrcode: description,

    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    name: "Tank scale T900",
    qrcode: description,
    isFavourite: true,
  ),
];

const String description =
    "Id: 102\nName: Scale F100\nRange: 10kg - 1000kg\nResolution: 1kg\nHeight: 10cm\nWidth: 30cm\nWeight: 5kg\nCreate at: 10/02/2021";
