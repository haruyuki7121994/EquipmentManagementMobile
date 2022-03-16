import 'package:appqrcode/services/FilterMaintenanceService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'FilterJobByDate.dart';
import 'login.dart';
import 'main_page.dart';

class MaintenanceCalendar extends StatelessWidget {
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
  @override
  SelectedDateRange createState() => SelectedDateRange();
}

List<String> views = <String>['Month', 'Year', 'Decade', 'Century'];

class SelectedDateRange extends State<ListPage> {
  late String _startDate, _endDate;
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    checkRole(context);
    final DateTime today = DateTime.now();
    _startDate = DateFormat('yyyy-MM-dd').format(today).toString();
    print(_startDate);
    _endDate = DateFormat('yyyy-MM-dd')
        .format(today.add(Duration(days: 3)))
        .toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(Duration(days: 3)));
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
    Scaffold(
        appBar: AppBar(
          title: Text("Maintenance Calendar "),
          leading: PopupMenuButton<String>(
            icon: Icon(Icons.calendar_today),
            itemBuilder: (BuildContext context) => views.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList(),
            onSelected: (String value) {
              if (value == 'Month') {
                _controller.view = DateRangePickerView.month;
              } else if (value == 'Year') {
                _controller.view = DateRangePickerView.year;
              } else if (value == 'Decade') {
                _controller.view = DateRangePickerView.decade;
              } else if (value == 'Century') {
                _controller.view = DateRangePickerView.century;
              }
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              // Container(
              //     margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              //     height: 50,
                  Card(
                    
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                      child: Container(
                          margin: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                               height: 35, width: 170,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text('Start Date: ' '$_startDate', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),))
                  ),
              //),
              Card(
                elevation: 8.0,
                margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: Container(height: 35, width: 170,
                    margin: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text('End Date: ' '$_endDate', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),),
              ),
              Card(
                margin: const EdgeInsets.fromLTRB(50, 40, 50, 50),
                child: SfDateRangePicker(
                  controller: _controller,
                  selectionMode: DateRangePickerSelectionMode.range,
                  onSelectionChanged: selectionChanged,
                  allowViewNavigation: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FilterJobByDate(startDate: _startDate, endDate: _endDate) )),
                    child: Text("SUBMIT", style: TextStyle(
                        color: Colors.white ,fontSize: 16
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate =
          DateFormat('yyyy-MM-dd').format(args.value.startDate).toString();
      print(_startDate);
      _endDate = DateFormat('yyyy-MM-dd')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
      print(_endDate);
    });
  }
}
checkRole(BuildContext context)async{
  final sharedPreferences = await SharedPreferences.getInstance();
  final role = sharedPreferences.getString('roles');

  if(role == '[ROLE_GUEST]'){

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('You do not have this permission'),
        content: const Text('Please log in with role Maintainer'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
            child: const Text('Login'),
          ),
        ],
      ),
    );
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage())
    );
  }
}
