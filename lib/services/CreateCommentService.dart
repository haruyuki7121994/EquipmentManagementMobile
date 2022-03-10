import 'package:appqrcode/models/Equipment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

createComment(String title, String description, String equipmentId) async{
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  final shareUser = await SharedPreferences.getInstance();
  final userId = shareUser.getString('type');
  print(userId);
  //http://localhost:8080/api/comments/create
  String _host = 'http://192.168.1.3:8080/';
  String api1 = 'api/comments/create';
  String uri = _host + api1;
  Map data = {
    'title': title,
    'description': description,
    'equipment_id': equipmentId,
    'user_id': userId,
  };
  print(data.toString());
  http.Response response = await http.post(
    Uri.parse(uri),
    headers: {
      "content-type" : "application/json",
      "accept" : "application/json",
      'Authorization': 'Bearer $value'
    },
    body: jsonEncode(data));
  if(response.statusCode == 200){
   print(response.statusCode);
  }else{
    print(response.statusCode);
  }
}
