import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:appqrcode/host.dart' as globals;

createComment(String username, String email, String password, String phone, String address, List<String> role, bool active) async{
  String _host = globals.Host();
  String api = 'api/auth/register';
  String uri = _host + api;
  Map data = {
    'username': username,
    'email': email,
    'password': password,
    'phone': phone,
    'address': address,
    'role': role,
    'active': active
  };
  print(data.toString());
  http.Response response = await http.post(
      Uri.parse(uri),
      headers: {
        "content-type" : "application/json",
        "accept" : "application/json",
      },
      body: jsonEncode(data));
  print(response.statusCode);
  if(response.statusCode == 200){
    print(response.statusCode);
  }else{
    print("failed register");
  }
}
