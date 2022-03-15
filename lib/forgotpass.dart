import 'dart:convert';

import 'package:appqrcode/newpassword.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:appqrcode/host.dart' as globals;

class ForgotPassword extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Center(
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                    ),
                  ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(errorText: "Enter valid email id"),
                    ])
                ),
              )
            ]),
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
                      onSignInClicked(
                          context,
                          _controller.text,
                      );
                    }
                  },
                  child: Text(
                    "Send",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

onSignInClicked(BuildContext context, String email) async {
  print("hello");
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  String _host = globals.Host();
  String api = 'api/auth/forgot-password/send';
  String url = _host + api;
  Map data = {
    'email': email,
  };
  var jsonResponse;
  print("abc");
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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewpasswordPage(email: email)));
    }
  } on Exception catch (e) {
    print(e.toString());
  }
}

class Album {
  final String email;

  const Album({
    required this.email,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(email: json['data']['email']);
  }
}
