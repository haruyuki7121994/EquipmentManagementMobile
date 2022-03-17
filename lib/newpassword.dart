import 'dart:convert';
import 'package:appqrcode/login.dart';
import 'package:appqrcode/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home_cubit.dart';
import 'package:appqrcode/host.dart' as globals;

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
  bool _showPass = false;
  final _formKey = GlobalKey<FormState>();
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
          child: ListView(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      obscureText: !_showPass,
                      controller: _controller1,
                      decoration: const InputDecoration(
                        labelText: 'Enter Code',
                      ),
                      validator: (controller) {
                        if (controller == null || controller.isEmpty) {
                          return 'Please enter Code ';
                        }
                        return null;
                      },
                    ),
                    GestureDetector(
                      onTap: onTogglesShowPass,
                      child: Text(_showPass ? "HIDE" : "SHOW",style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10
                      ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: !_showPass,
                      controller: _controller2,
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
                      child: Text(_showPass ? "HIDE" : "SHOW",style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10
                      ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: !_showPass,
                      controller: _controller3,
                      decoration: const InputDecoration(
                        labelText: 'Enter RePassword',
                      ),
                      validator: (val) => MatchValidator(errorText: 'passwords do not match').validateMatch(val!, _controller2.text),
                    ),
                    GestureDetector(
                      onTap: onTogglesShowPass,
                      child: Text(_showPass ? "HIDE" : "SHOW",style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10
                      ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     height: 40,
                    //     child: RaisedButton(
                    //       color: Colors.blue,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.all(Radius.circular(50))),
                    //       onPressed: () => onSignInClicked(
                    //           context, _controller1.text, _controller2.text, _controller3.text, widget.email),
                    //       child: Text(
                    //         "Save",
                    //         style: TextStyle(color: Colors.white, fontSize: 16),
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                                  _controller1.text,_controller2.text,_controller3.text,widget.email,
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
              )
            ],

          ),
        ),
      ),
    );
  }
  void onTogglesShowPass(){
    setState(() {
      _showPass = !_showPass;
    });
  }
}

onSignInClicked(BuildContext context,String code, String newPassword, String rePassword, String email) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  String _host = globals.Host();
  String api = 'api/auth/forgot-password/verify';
  String url = _host+api;
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
