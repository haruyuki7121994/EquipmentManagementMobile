import 'dart:convert';
import 'package:appqrcode/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home_cubit.dart';


class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  _UpdatePage createState() {
    return _UpdatePage();
  }
}

class _UpdatePage extends State<UpdatePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Update Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Update'),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context1, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Card(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Update Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:40,
                        ),
                      ),
                      SizedBox(height: 40,),
                      Text(
                        "Phone",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:25,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(snapshot.data!.phone,style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 20
                      ),),
                      TextField(
                        controller: _controller1,
                        decoration: const InputDecoration(
                          labelText: 'Enter phone',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Address",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:25,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(snapshot.data!.address,style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),),
                      TextField(
                        controller: _controller2,
                        decoration: const InputDecoration(
                          labelText: 'Enter address',
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                            onPressed: () => onSignInClicked(context, _controller1.text, _controller2.text),
                            child: Text("Save", style: TextStyle(
                                color: Colors.white ,fontSize: 16
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

onSignInClicked(BuildContext context, String phone, address) async{
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  String url = "http://192.168.0.103:8080/api/auth/edit/profile";
  Map data = {
    'address': address,
    'phone': phone
  };
  var jsonResponse;
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
      // Navigator.of(context).push();
      Navigator.push(context,  MaterialPageRoute(builder: (context)=> Profile()));
    }
  } on Exception catch (e) {
    print(e.toString());
  }

}

Future<Album> fetchProfile() async {
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
    throw Exception('Failed fetch');
  }
}
_save(String token) async{
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = token;
  sharedPreferences.setString('token', value);
}

Future<Album> updateAlbum(String phone, String address) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  final response = await http.put(
    Uri.parse('http://192.168.0.103:8080/api/auth/profile'),
    headers: <String, String>{
      "content-type": "application/json",
      "accept": "application/json",
      'Authorization': 'Bearer $value'
    },
    body: jsonEncode(<String, String>{
      'phone': phone,
      'address': address,
    }),
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
  final String phone;
  final String address;

  const Album({
    required this.phone,
    required this.address,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      phone: json['data']['phone'],
      address: json['data']['address'],
    );
  }
}