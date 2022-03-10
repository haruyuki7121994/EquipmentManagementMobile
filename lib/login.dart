
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'forgotpass.dart';
import 'home.dart';
import 'home_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{

  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userNameErr = "Invalid username";
  var _passErr = "Password must be over 6 characters";
  var _userInvalid = false;
  var _passInvalid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
              image: AssetImage(
                  "images/login.png"
              )
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(110,0,0,20),
              child: Text('Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,30,0,20),
              child: TextField(
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
                controller: _userController,
                decoration: InputDecoration(
                    labelText: "USERNAME",
                    errorText: _userInvalid ? _userNameErr : null,
                    labelStyle: TextStyle(
                        color: Color(0xff888888),
                        fontSize: 15
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children:<Widget>[
                  TextField(
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),
                    controller: _passController,
                    obscureText: !_showPass,
                    decoration: InputDecoration(
                        labelText: "PASSWORD",
                        errorText: _passInvalid ? _passErr : null,
                        labelStyle: TextStyle(
                            color: Color(0xff888888),
                            fontSize: 15
                        )
                    ),
                  ),
                  GestureDetector(
                    onTap: onTogglesShowPass,
                    child: Text(_showPass ? "HIDE" : "SHOW",style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14
                    ),
                    ),
                  ),
                ],
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
                  onPressed: () => onSignInClicked(_userController.text, _passController.text),
                  child: Text("SIGN IN", style: TextStyle(
                      color: Colors.white ,fontSize: 16
                  ),),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: Text("FORGOT PASSWORD?",
                      style: TextStyle(fontSize: 15,color: Colors.blue),),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  onSignInClicked(String username, password) async{
    String token;
    String url = "http://192.168.0.103:8080/api/auth/login";
    Map data = {
      'username': username,
      'password': password
    };
    var jsonResponse;
    var response = await http.post(Uri.parse(url),
        headers: {
          "content-type" : "application/json",
          "accept" : "application/json",
        },
        body: jsonEncode(data));
    if(response.statusCode == 200){
      jsonResponse = jsonDecode(response.body);
      if(jsonResponse != null){
        token = jsonResponse['data']['token'];
        _save(token);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (_) => HomeCubit(),
            child: HomePage(),
          );
        }));
      }
    }

    //print(response.statusCode);
    //setState(() {
      // if(_userController.text.length < 6 || !_userController.text.contains("@")){
      //   _userInvalid = true;
      // }else{
      //   _userInvalid = false;
      // }
      //
      // if(_passController.text.length < 6){
      //   _passInvalid = true;
      // }else{
      //   _passInvalid = false;
      // }

    //   if(!_userInvalid && !_passInvalid){
    //     // Navigator.push(context, MaterialPageRoute(builder: gotoHome));
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) {
    //           return BlocProvider(
    //             create: (_) => HomeCubit(),
    //             child: HomePage(),
    //           );
    //     }));
    //   }
    // });
  }
  _save(String token) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = token;
    sharedPreferences.setString('token', value);
  }
  _read() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = sharedPreferences.getString('token');
    print('read: $value');
  }
  void onTogglesShowPass(){
    setState(() {
      _showPass = !_showPass;
    });
  }
}