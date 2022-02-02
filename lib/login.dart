import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: LoginPage());
  }
}

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
              fit: BoxFit.fill,
              image: AssetImage(
                  "images/login.png"
              )
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30,0,0,100),
              child: Text('Hello \nWellcome To The Product Management App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,40),
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  onPressed: onSignInClicked,
                  child: Text("SIGN IN", style: TextStyle(
                      color: Colors.white ,fontSize: 16
                  ),),
                ),
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "NEW USER? SIGN UP",
                    style: TextStyle(fontSize: 15,color: Color(0xff888888)),

                  ),
                  Text(
                    "FORGOT PASSWORD?",
                    style: TextStyle(fontSize: 15,color: Colors.blue),

                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void onSignInClicked(){
    setState(() {
      if(_userController.text.length < 6 || !_userController.text.contains("@")){
        _userInvalid = true;
      }else{
        _userInvalid = false;
      }

      if(_passController.text.length < 6){
        _passInvalid = true;
      }else{
        _passInvalid = false;
      }

      if(!_userInvalid && !_passInvalid){
        // Navigator.push(context, MaterialPageRoute(builder: gotoHome));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  Widget gotoHome(BuildContext context){
    return HomePage();
  }

  void onTogglesShowPass(){
    setState(() {
      _showPass = !_showPass;
    });
  }


}