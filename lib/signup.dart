import 'package:appqrcode/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:appqrcode/services/RegisterService.dart';

class SignupPage extends StatefulWidget{
  @override
  State<SignupPage> createState() => _SignupPageState();
}



class _SignupPageState extends State<SignupPage> {
  String _selectRole = 'guest';
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _addressnameController = new TextEditingController();

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
        // child: Container(
        //   padding: EdgeInsets.symmetric(horizontal: 40),
        //   height: MediaQuery.of(context).size.height - 50,
        //   width: double.infinity,

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
              Form(
                key: formkey,
                child: Column(
                  children: <Widget> [
                  //   inputFile(label: "Username", controller: _usernameController),
                  //   inputFile(label: "Email"),
                  //   inputFile(label: "Password", obscureText: true),
                  //   inputFile(label: "Confirm Password ", obscureText: true),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                        controller: _usernameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                              hintText: 'Enter username'),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                        controller: _emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter valid email id as abc@gmail.com'),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            EmailValidator(errorText: "Enter valid email id"),
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                        controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter secure password'),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                            MinLengthValidator(6,
                                errorText: "Password should be atleast 6 characters"),
                            MaxLengthValidator(15,
                                errorText:
                                "Password should not be greater than 15 characters")
                          ])
                        //validatePassword,        //Function to check validation
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                              hintText: 'Confirm password'),

                          validator: (val) => MatchValidator(errorText: 'passwords do not match').validateMatch(val!, _passwordController.text),

                        //validatePassword,        //Function to check validation
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Phone',
                              hintText: 'Enter phone number'),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                          controller: _addressnameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Address',
                              hintText: 'Enter Address'),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "* Required"),
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: ListTile(
                        title: const Text('Guest'),
                        leading: Radio<String>(
                          value: 'guest',
                          groupValue: _selectRole,
                          onChanged: (value) {
                            setState(() {
                              _selectRole = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 0, bottom: 0),
                      child: ListTile(
                        title: const Text('Maintainer\n(need approval before login)'),
                        leading: Radio<String>(
                          value: 'maintainer',
                          groupValue: _selectRole,
                          onChanged: (value) {
                            setState(() {
                              _selectRole = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],

                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3, bottom: 30),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 40,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      String username = _usernameController.text;
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      String phone = _phoneController.text;
                      String address = _addressnameController.text;
                      List<String> role=[];
                      role.add(_selectRole);
                      bool active = true;
                      if (_selectRole == 'guest'){
                        active = true;
                      }else{
                        active = false;
                      }
                      // print(role);
                      // print(active);
                      createComment(username, email, password, phone, address, role, active);

                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Sign up'),
                          content: const Text('Successful! Log in now?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
                              child: const Text('Login'),
                            ),
                          ],
                        ),
                      );
                      print("Validated");
                    } else {
                      print("Not Validated");
                    }
                  },
                  // =>showDialog<String>(
                  //   context: context,
                  //   builder: (BuildContext context) => AlertDialog(
                  //     title: const Text('Sign up'),
                  //     content: const Text('Successful'),
                  //     actions: <Widget>[
                  //       TextButton(
                  //         onPressed: () => Navigator.pop(context, 'Cancel'),
                  //         child: const Text('Cancel'),
                  //       ),
                  //       TextButton(
                  //         onPressed: () => Navigator.pop(context, 'OK'),
                  //         child: const Text('OK'),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //{Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));},
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

            ],
          //),
        ),
      ),
    );
  }
}

// Widget inputFile({label, obscureText = false, controller})
// {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: TextStyle(
//             fontSize: 10,
//             fontWeight: FontWeight.w400,
//             color:Colors.black87
//         ),
//
//       ),
//       SizedBox(
//         height:10,
//       ),
//       TextField(
//         obscureText: obscureText,
//         controller: controller,
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0,
//                 horizontal: 10),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                   color: Colors.grey,
//               ),
//
//             ),
//             border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey)
//             )
//         ),
//       ),
//       SizedBox(height: 10,)
//     ],
//   );
// }