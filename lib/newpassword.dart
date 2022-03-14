import 'dart:convert';
import 'package:appqrcode/login.dart';
import 'package:appqrcode/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home_cubit.dart';

class NewpasswordPage extends StatefulWidget {
  final String email;
  const NewpasswordPage({Key? key, required this.email}) : super(key: key);

  @override
  _UpdatePage createState() {
    return _UpdatePage();
  }
}

class _UpdatePage extends State<NewpasswordPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String email = widget.email;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create a new password',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create a new password'),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Create a new password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Enter Code",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                TextField(
                  controller: _controller1,
                  decoration: const InputDecoration(
                    labelText: 'Enter Code',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Enter new Password",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                TextField(
                  controller: _controller2,
                  decoration: const InputDecoration(
                    labelText: 'Enter New Password',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Enter Repassword",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
                TextField(
                  controller: _controller3,
                  decoration: const InputDecoration(
                    labelText: 'Enter RePassword',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      onPressed: () => onSignInClicked(
                          context, _controller1.text, _controller2.text, _controller3.text, widget.email),
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

onSignInClicked(BuildContext context,String code, String newPassword, String rePassword, String email) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  String url = "http://192.168.0.103:8080/api/auth/forgot-password/verify";
  Map data = {'newPassword': newPassword, 'rePassword': rePassword, 'code' : code, 'email': email};
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
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  } on Exception catch (e) {
    print(e.toString());
  }
}


class Album {
  final String newPassword;
  final String rePassword;
  final String code;

  const Album({
    required this.newPassword,
    required this.rePassword,
    required this.code,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      newPassword: json['data']['password'],
      rePassword: json['data']['rePassword'],
      code: json['data']['code'],
    );
  }
}