import 'dart:convert';

import 'package:appqrcode/newpassword.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;




class ForgotPassword extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPassword> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email'),
      ),
      body: Column(
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
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),

                  ),
                ),
              ),
            )
          ]),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: FlatButton(
              color: Colors.blue,
              onPressed: () => onSignInClicked(context, _controller.text),
              child: Text(
                'Send email',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

onSignInClicked(BuildContext context, String email) async{
  print("hello");
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  String url = "http://192.168.0.103:8080/api/auth/forgot-password/send";
  Map data = {
    'email': email,

  };
  var jsonResponse;
  print("abc");
  var response = await http.post(Uri.parse(url),
      headers: {
        "content-type" : "application/json",
        "accept" : "application/json",
        "Authorization": "Bearer $value"
      },
      body: jsonEncode(data));
  print(response.body);
  jsonResponse = jsonDecode(response.body);
  try {
    print(response.statusCode);
    if(response.statusCode == 200){
      print('abc');
      Navigator.push(context,  MaterialPageRoute(builder: (context)=> NewpasswordPage(email: email)));
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
    return Album(
      email: json['data']['email']
    );
  }
}


