import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:appqrcode/components/default_button.dart';
import 'package:appqrcode/services/EquipmentService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../login.dart';
import 'package:appqrcode/models/Equipment.dart';
import 'package:appqrcode/models/GalleryItemModel.dart';
import 'package:appqrcode/details/components/GalleryPhotoWrapper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:appqrcode/details/components/GalleryThumbnail.dart';
import 'package:appqrcode/details/components/comment.dart';

class EquipmentDetail extends StatefulWidget {
  final Equipment equipment;
  const EquipmentDetail({Key? key, required this.equipment}) : super(key: key);
  //static String routeName = "/equipment_details";

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<EquipmentDetail> {

  List<GalleryItemModel> galleries = [];
  int _current = 0;

  @override
  void initState() {
    super.initState();

    widget.equipment.images!.forEach((image) {
      galleries.add(GalleryItemModel(
        id: image.id, resource: image.path, description: '',));

    });
  }

  void _open(BuildContext context, final int index){
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => GalleryPhotoWrapper(
              galleries: galleries,
              backgroundDecoration: const BoxDecoration(
                  color: Colors.black
              ),
              initalIndex: index,
              scrollDirection: Axis.horizontal,
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    String qrocde = widget.equipment.qrcode;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail", style: TextStyle( fontSize: 30, color: Colors.white),),
        backgroundColor: Colors.blue,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          CarouselSlider(
              items: galleries.map((item) => Container(
                  child: GalleryItemThumbnail(
                    galleryItemModel: item,
                    onTap: (){
                      _open(context, 0);
                    },
                  )
              )).toList(),
              options: CarouselOptions(
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason){
                    setState(() {
                      _current = index;
                    });
                  }
              )
          ),

          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: galleries.map((url) {
                int index = galleries.indexOf(url);
                return Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index ? Colors.redAccent : Colors.grey
                      )
                  ),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 20),

          Divider(thickness: 3, color: Colors.grey),

          SizedBox(height: 20),

          Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 30),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                color: Colors.white,
                elevation: 1.0,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Detail Info", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.only(right: 200),
                        child: Divider(thickness: 3, color: Colors.grey),
                      ),
                      SizedBox(height: 20,),
                      LableInfo(header: "Brand", name: widget.equipment?.id),
                      SizedBox(height: 10,),
                      LableInfo(header: "Category", name: widget.equipment?.name),
                      SizedBox(height: 10,),
                      LableInfo(header: "Collection", name: widget.equipment?.name),
                      SizedBox(height: 10,),
                      LableInfo(header: "Name", name: widget.equipment.images![1].path),
                      SizedBox(height: 10,),
                      LableInfo(header: "Description", name: widget.equipment?.status),
                      SizedBox(height: 10,),
                      DefaultButton(text: "Comment",
                        press: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Comment(qrcode: qrocde)))),

                    ],
                  ),
                ),
              )
          ),

        ],
      ),
    );
  }

}
class LableInfo extends StatelessWidget {
  final String? header;
  final String? name;
  const LableInfo({Key? key, this.header, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              child: Text(
                  name!
              ),
            ),
          ),
          Divider(thickness: 2, color: Colors.grey),
        ],
      ),
    );
  }
}