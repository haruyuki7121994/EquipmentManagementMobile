import 'dart:convert';
import 'package:appqrcode/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appqrcode/host.dart' as globals;

class UpdatePhonePage extends StatefulWidget {
  final String address;

  const UpdatePhonePage({Key? key, required this.address}) : super(key: key);

  @override
  _UpdatePhonePage createState() {
    return _UpdatePhonePage();
  }
}

class _UpdatePhonePage extends State<UpdatePhonePage> {
  final TextEditingController _controller1 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String address = widget.address;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Update Phone'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _controller1,
                  decoration: const InputDecoration(
                    labelText: 'Enter Phone',
                  ),
                  validator: (controller) {
                    if (controller == null || controller.isEmpty || controller.length < 10) {
                      return 'Please enter phone number and \nPhone number cannot be less than 10 characters';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ElevatedButton(
                              context,
                              _controller1.text,widget.address
                          );
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
      ) ;
  }
}

ElevatedButton(BuildContext context, String phone, String address) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  String _host = globals.Host();
  String api = 'api/auth/edit/profile';
  String url = _host+api;
  Map data = {'phone': phone, 'address': address};
  print(phone);
  print(address);
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
          context, MaterialPageRoute(builder: (context) => Profile()));
    }
  } on Exception catch (e) {
    print(e.toString());
  }
}

class Album {
  final String phone;

  const Album({
    required this.phone,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      phone: json['data']['phone'],
    );
  }
}
