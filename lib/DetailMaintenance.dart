
import 'package:appqrcode/models/Equipment.dart';
import 'package:flutter/material.dart';

import 'details/EquipmentDetails.dart';
import 'models/Maintenance.dart';


class DetailMaintenance extends StatefulWidget {
  List<Equipment>? eList;
  DetailMaintenance({Key? key, this.eList}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<DetailMaintenance> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Equipment>? eList = widget.eList;
    ListTile makeListTile(Equipment equipment) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0) ,
            child: Text(
            'Name: ${equipment.name}',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
          ),
          //const SizedBox(width: 10,),
          // Text(
          //   equipment.id ,
          //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          // ),
        ]
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
      subtitle: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(equipment.qrcode,
              style: TextStyle(color: Colors.black))),
      // Row(
      //   children: <Widget>[
      //     Expanded(
      //       flex: 4,
      //       child:
      //     )
      //   ],
      // ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EquipmentDetail(equipment: equipment)));
      },
    );

    Card makeCard(Equipment equipment) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: makeListTile(equipment),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: eList?.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(eList![index]);
        },
      ),
    );


    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.blue,
      title: Text('List equipment'),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

