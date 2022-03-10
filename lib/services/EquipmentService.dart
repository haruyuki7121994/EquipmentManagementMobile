import 'package:appqrcode/models/Equipment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Equipment> getEquipment(String? qrcode) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');

  print(value);
  String _baseUrl = 'http://192.168.1.3:8080/api/equipments/qrcode/';
  String url = _baseUrl + qrcode!;
  final response = await http.get(
    Uri.parse(url),
    // Send authorization headers to the backend.
    headers: {
      "content-type" : "application/json",
      "accept" : "application/json",
      'Authorization': 'Bearer $value'
    },
  );
  if(response.statusCode == 200){
    final responseJson = jsonDecode(response.body);
    print(responseJson);
    return Equipment.fromJson(responseJson);
  }else{
    throw Exception('Failed');
  }
}
