import 'package:appqrcode/models/Equipment.dart';
import 'package:appqrcode/services/MaintenanceService.dart';
import 'package:appqrcode/top_container.dart';
import 'package:flutter/material.dart';
import 'package:appqrcode/models/Maintenance.dart';
import 'package:appqrcode/services/MaintenanceService.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'DetailMaintenance.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primaryColor: Colors.yellow, fontFamily: 'Raleway'),
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
    double width = MediaQuery.of(context).size.width;
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
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                  const SizedBox(width: 30,),
                  Text(
                    maintenance.user,
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ]),
              trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
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
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: makeListTile(maintenance),
              ),
            );
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: <Widget>[
                    TopContainer(
                      height: 200,
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    animation: true,
                                    percent: 1,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: Colors.white,
                                    backgroundColor: Colors.lightBlue,
                                    center: const CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 50.0,
                                      backgroundImage: AssetImage(
                                        'assets/images/bench scale.png',
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          'Welcome to',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          'Equipment manager',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 40),
                      child: Column(
                        children:[
                          const Text("Maintenance Schedule",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Container(

                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0.0),
                            decoration: BoxDecoration(color: Colors.white),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: list?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return makeCard(list![index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
            );
          }else if(snapshot.hasError){
            return Scaffold(
              body: TopContainer(
                height: 200,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 1,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.white,
                              backgroundColor: Colors.lightBlue,
                              center: const CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 50.0,
                                backgroundImage: AssetImage(
                                  'assets/images/bench scale.png',
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'Welcome to',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Equipment manager',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            );
          }
          return Container();
          }

      ),
    );


  }
}


