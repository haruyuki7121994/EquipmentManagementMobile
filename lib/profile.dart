import 'dart:convert';
import 'package:appqrcode/changepassword.dart';
import 'package:http/http.dart' as http;
import 'package:appqrcode/updateProfile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Profile extends StatefulWidget {

  static const routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<Album> futureAlbum;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _getHeader(),
          SizedBox(
            height: 10,
          ),
          _profileName("username"),
          SizedBox(
            height: 14,
          ),
          _heading("Profile Details"),
          SizedBox(
            height: 6,
          ),
          _detailsCard(),
          SizedBox(
            height: 10,
          ),
          _heading("Settings"),
          SizedBox(
            height: 6,
          ),
          _settingsCard(),
          Spacer(),
          logoutButton()
        ],
      )),
    );
  }

  Widget _getHeader() {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 5),
          shape: BoxShape.circle,
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                "images/user.png"
            )
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(70, 40, 0, 0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ));
  }

  Widget _profileName(String username) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90, //80% of width,
      child: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!.username,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }



  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Card(
                  child: Column(
                    children: [
                      //row for each deatails
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text(snapshot.data!.email),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text(snapshot.data!.phone),
                      ),
                      Divider(
                        height: 0.6,
                        color: Colors.black87,
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text(snapshot.data!.address),
                      )
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
//
  }

  Widget _settingsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: Text("Update Profile"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdatePage()));
              },
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.password_sharp),
              title: Text("Change Password"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangepasswordPage()));
              },
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return InkWell(

      onTap: () async {
        final sharedPreferences = await SharedPreferences.getInstance();
        const value = "";
        sharedPreferences.setString('token', value);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}

Future<Album> fetchAlbum() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  final response = await http
      .get(Uri.parse('http://192.168.0.103:8080/api/auth/profile'), headers: {
    "content-type": "application/json",
    "accept": "application/json",
    'Authorization': 'Bearer $value'
  });
  if (response.statusCode == 200) {
    final responseJson = jsonDecode(response.body);
    print(response.statusCode);
    return Album.fromJson(responseJson);
  } else {
    throw Exception('Failed');
  }
}

class Album {
  final String username;
  final String email;
  final String phone;
  final String address;


  const Album({
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      username: json['data']['username'],
      email: json['data']['email'],
      phone: json['data']['phone'],
      address: json['data']['address'],
    );
  }
}
