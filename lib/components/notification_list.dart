import 'dart:convert';
import 'package:appqrcode/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:appqrcode/components/notification_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appqrcode/host.dart' as globals;


import '../login.dart';
import '../main_page.dart';

class NotificationList extends StatefulWidget {
  static const routeName = "/profile";
  @override
  _NotificationState createState() => _NotificationState();


}


checkRole(BuildContext context)async{
  final sharedPreferences = await SharedPreferences.getInstance();
  final role = sharedPreferences.getString('roles');

  if(role == '[ROLE_GUEST]'){

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('You do not have this permission'),
        content: const Text('Please log in with role Maintainer'),
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage())
    );
  }
}


class _NotificationState  extends State<NotificationList> {

  late Future <List<Album>> futureAlbum;
  late SharedPreferences sharedPreferences;
  List<Album>? list;



  @override
  void initState() {
    super.initState();
    checkRole(context);
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: FutureBuilder<List<Album>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                list = snapshot.data;
                print(list);
                ListTile makeListTile(Album album) => ListTile(
                  subtitle: Column(
                        children:<Widget> [
                          SizedBox(height: 30,),
                          NotificationItem(
                            title: album.title,
                            description: album.description,
                            icon: album.read ? Icons.mark_email_read : Icons.mark_email_unread,
                            created_at: album.createdAt,
                          ),
                        ],
                    ),
                );
                Card makeCard(Album album) => Card(
                  elevation: 8.0,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: makeListTile(album),
                  ),
                );
                return Card(
                 child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: list?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return makeCard(list![index]);
                      },
                    ),
                  ),

                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}


Future <List<Album>> fetchAlbum() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  print(value);
  final shareUsername = await SharedPreferences.getInstance();
  final username = shareUsername.getString('username');
  String _host = globals.Host();
  String api = 'api/notifications/all?username=';
  String url = _host+api+username!;
  final response = await http
      .get(Uri.parse(url), headers: {
    "content-type": "application/json",
    "accept": "application/json",
    'Authorization': 'Bearer $value'
  });
  print(response.statusCode);
  if (response.statusCode == 200) {
    final responseJson = jsonDecode(response.body);
    final notiList = responseJson['data'] as List<dynamic>;
    print(response.statusCode);
    final noti = notiList != null ? notiList.map((notiList) => Album.fromJson(notiList)).toList() : <Album>[];
    return noti;
  } else {
    throw Exception('Failed');
  }
}

class Album {
  final String title;
  final String description;
  final String createdAt;
  final bool read;


  const Album({
    required this.title,
    required this.description,
    required this.createdAt,
    required this.read,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'],
      description: json['description'],
      createdAt: json['createdAt'],
      read: json['read']
    );
  }
}


