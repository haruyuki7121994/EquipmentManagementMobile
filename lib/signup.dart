import 'package:appqrcode/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
          size: 20,
            color: Colors.black,),

        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Create an account, It's free",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget> [
                  inputFile(label: "Username"),
                  inputFile(label: "Email"),
                  inputFile(label: "Password", obscureText: true),
                  inputFile(label: "Confirm Password ", obscureText: true),
                ],
              ),
              Container(
          padding: EdgeInsets.only(top: 3, left: 3),
          child: MaterialButton(
            minWidth: double.infinity,
            height: 40,
            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));},
            color: Colors.blue,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              "Sign up", style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
            ),
          ),
        ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  Text(" Login", style:TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18

                  ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height:10,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey,
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}