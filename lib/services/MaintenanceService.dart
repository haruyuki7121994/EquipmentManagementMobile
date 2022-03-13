import 'package:appqrcode/models/Maintenance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future <List<Maintenance>> getMaintenance() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');

  print(value);
  String _baseUrl = 'http://192.168.1.7:8080/api';
  String api = '/maintenances/all?size=100&page=0&orderBy=dateMaintenance-asc';
  String url = _baseUrl + api;
  final response = await http.get(
    Uri.parse(url),
    // Send authorization headers to the backend.
    headers: {
      "content-type" : "application/json",
      "accept" : "application/json",
      'Authorization': 'Bearer $value'
    },
  );
  print(response.statusCode);
  if(response.statusCode == 200){
    final data = jsonDecode(response.body);
    print(data);
    final dataJson = data['data']['maintenances'] as List<dynamic>?;
    print(dataJson);
    final maintenanceList = dataJson != null
        ? dataJson.map((dataJson) => Maintenance.fromJson(dataJson))
        .toList()
        : <Maintenance>[];
    print(maintenanceList[0].dateMaintenance);
    return maintenanceList;
  }else{
    throw Exception('Failed');
  }
}
