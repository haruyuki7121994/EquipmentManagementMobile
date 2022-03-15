import 'package:appqrcode/models/Equipment.dart';
import 'package:appqrcode/services/FilterMaintenanceService.dart';

import 'package:flutter/material.dart';
import 'package:appqrcode/models/Maintenance.dart';


import 'DetailMaintenance.dart';



class FilterJobByDate extends StatefulWidget {
  String startDate, endDate;
  FilterJobByDate({Key? key, required this.startDate, required this.endDate}) : super(key: key);



  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<FilterJobByDate> {

  late Future<List<Maintenance>> filterDate;
  List<Maintenance>? list;

  @override
  void initState() {
    filterDate = filterMaintenance(widget.startDate, widget.endDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Maintenance>>(
          future: filterDate,
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
                appBar: AppBar(
                  elevation: 0.1,
                  backgroundColor: Colors.blue,
                  title: Text("Maintenance"),
                ),
                body: SafeArea(
                  child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 40),
                          child: Column(
                            children:[
                              const Text("Job list filtered by date",
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
                appBar: AppBar(
                  elevation: 0.1,
                  backgroundColor: Colors.blue,
                  title: Text("Maintenance",),
                ),
                body: SafeArea(
                  child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              const Text("Job list filtered by date",
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,

                                ),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                child: Text("no data"),

                              ),
                            ],
                          ),
                        ),
                      ]
                  ),
                ),
              );
            }
            return Container();
          }

      ),
    );
  }
}


