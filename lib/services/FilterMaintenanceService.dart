import 'package:appqrcode/models/Maintenance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:appqrcode/host.dart' as globals;

Future <List<Maintenance>> filterMaintenance(String startDate, String endDate) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final value = sharedPreferences.getString('token');
  final sharedUsername = await SharedPreferences.getInstance();
  final username = sharedUsername.getString('username');
  print(value);

  String _host = globals.Host();
  //String uri = 'api/maintenances/all?size=100&page=0&orderBy=dateMaintenance-asc&username=maintainer2';
  http://localhost:8080/api/maintenances/all?size=1000&page=0&orderBy=dateMaintenance-asc&username=aptech
  String api = 'api/maintenances/all?size=1000&page=0&orderBy=dateMaintenance-asc&username=';
  String url = _host+api+username!+'&startDate='+startDate+'&endDate='+endDate;
  print(url);

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
