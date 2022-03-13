import 'package:appqrcode/models/Equipment.dart';
import 'package:appqrcode/services/MaintenanceService.dart';
import 'package:flutter/material.dart';
import 'package:appqrcode/models/Maintenance.dart';
import 'package:appqrcode/services/MaintenanceService.dart';

import 'DetailMaintenance.dart';

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new ListPage(),
      // home: DetailPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);



  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<List<Maintenance>> maintenancesList;
  List<Maintenance>? list;

  @override
  void initState() {
    maintenancesList = getMaintenance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: FutureBuilder<List<Maintenance>>(
        future: maintenancesList,
          builder: (context, snapshot){
          if(snapshot.hasData){
            print('hasData');
            list = snapshot.data;

            ListTile makeListTile(Maintenance maintenance) => ListTile(
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Row(
                children: [
                Text(
                  maintenance.dateMaintenance,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                  const SizedBox(width: 30,),
                  Text(
                    maintenance.user,
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ]),

              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              // subtitle: Row(
              //   children: <Widget>[
              //     Expanded(
              //         flex: 1,
              //         child: Container(
              //           // tag: 'hero',
              //           child: LinearProgressIndicator(
              //               backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
              //               value: maintenance.indicatorValue,
              //               valueColor: AlwaysStoppedAnimation(Colors.green)),
              //         )),
              //     Expanded(
              //       flex: 4,
              //       child: Padding(
              //           padding: EdgeInsets.only(left: 10.0),
              //           child: Text(lesson.level,
              //               style: TextStyle(color: Colors.white))),
              //     )
              //   ],
              // ),
              trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
              onTap: () {
                String id = maintenance.id;
                print(id);
                List<Equipment>? eList = maintenance.equipment;
                print(eList.toString());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailMaintenance(eList: eList)));
               },
            );

            Card makeCard(Maintenance maintenance) => Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                child: makeListTile(maintenance),
              ),
            );
            return Scaffold(
              backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
              appBar: AppBar(
                elevation: 0.1,
                backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
                title: Text('Maintenance Schedule'),
              ),
              body: Container(
                decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: list?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return makeCard(list![index]);
                  },
                ),
              ),
            );


          }else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return Container();
          }

      ),
    );


  }
}


