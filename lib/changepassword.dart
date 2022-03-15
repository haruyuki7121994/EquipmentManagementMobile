import 'dart:convert';
import 'package:appqrcode/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home_cubit.dart';
import 'package:appqrcode/host.dart' as globals;

class ChangepasswordPage extends StatefulWidget {
  const ChangepasswordPage({Key? key}) : super(key: key);

  @override
  _UpdatePage createState() {
    return _UpdatePage();
  }
}

class _UpdatePage extends State<ChangepasswordPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPass = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'change Password',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Change Password'),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Enter new Password",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                TextFormField(
                  obscureText: !_showPass,
                  controller: _controller1,
                  decoration: const InputDecoration(
                    labelText: 'Enter New Password',
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "* Required"),
                    MinLengthValidator(6,
                        errorText: "Password should be atleast 6 characters"),
                    MaxLengthValidator(15,
                        errorText:
                        "Password should not be greater than 15 characters")
                  ]),
                ),

                GestureDetector(
                  onTap: onTogglesShowPass,
                  child: Text(_showPass ? "HIDE" : "SHOW", style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14
                  ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Enter Repassword",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                TextFormField(
                  obscureText: !_showPass,
                  controller: _controller2,
                  decoration: const InputDecoration(
                    labelText: 'Enter RePassword',
                  ),
                  validator: (val) => MatchValidator(errorText: 'passwords do not match').validateMatch(val!, _controller1.text),

                ),
                GestureDetector(
                  onTap: onTogglesShowPass,
                  child: Text(_showPass ? "HIDE" : "SHOW", style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14
                  ),
                  ),
                ),
                SizedBox(
                  height: 40,
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
                              context,
                              _controller1.text,_controller2.text
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
      ),
    );
  }

  void onTogglesShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}


ElevatedButton(BuildContext context, String password, String rePassword) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  String _host = globals.Host();
  String api = 'api/auth/edit/password';
  String url = _host+api;
  Map data = {'password': password, 'rePassword': rePassword};
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

_save(String token) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = token;
  sharedPreferences.setString('token', value);
}

Future<Album> updateAlbum(String password, String rePassword) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  String _host = globals.Host();
  String api = 'api/auth/edit/password';
  String url = _host+api;
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      "content-type": "application/json",
      "accept": "application/json",
      'Authorization': 'Bearer $value'
    },
    body: jsonEncode(
        <String, String>{'password': password, 'rePassword': rePassword}),
  );
  print("album ${response.statusCode}");
  if (response.statusCode == 200) {
    final responseJson = jsonDecode(response.body);
    print(response.statusCode);
    return Album.fromJson(responseJson);
  } else {
    throw Exception('Failed');
  }
}

class Album {
  final String password;
  final String rePassword;

  const Album({
    required this.password,
    required this.rePassword,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      password: json['data']['password'],
      rePassword: json['data']['rePassword'],
    );
  }
}
