import 'dart:convert';
import 'package:appqrcode/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appqrcode/host.dart' as globals;

import 'home_cubit.dart';

class UpdateAddressPage extends StatefulWidget {
  final String phone;

  const UpdateAddressPage({Key? key, required this.phone}) : super(key: key);

  @override
  _UpdateAddressPage createState() {
    return _UpdateAddressPage();
  }
}

class _UpdateAddressPage extends State<UpdateAddressPage> {
  final TextEditingController _controller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String address = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Update Address'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Address",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _controller2,
                  decoration: const InputDecoration(
                    labelText: 'Enter Address ',
                  ),
                  validator: (controller) {
                    if (controller == null || controller.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ElevatedButton(
                              context, _controller2.text, widget.phone);
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

ElevatedButton(BuildContext context, String address, String phone) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  String _host = globals.Host();
  String api = 'api/auth/edit/profile';
  String url = _host+api;
  Map data = {'address': address,'phone': phone, };
  var jsonResponse;
  var response = await http.post(Uri.parse(url),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
        "Authorization": "Bearer $value"
      },
      body: jsonEncode(data));
  print(response.body);
  jsonResponse = jsonDecode(response.body);
  try {
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('abc');
      // Navigator.of(context).push();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) {
        return BlocProvider(
          create: (_) => HomeCubit(),
          child: Profile(),
        );
      }));
    }
  } on Exception catch (e) {
    print(e.toString());
  }
}

class Album {
  final String address;

  const Album({
    required this.address,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      address: json['data']['address'],
    );
  }
}
