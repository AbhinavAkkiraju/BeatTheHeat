import 'dart:convert';

import 'package:http/http.dart' as http;

class DataServices {
  String baseUrl = "http://beattheheat.azurewebsite.net/swagger/index.html";
  getInfo() async {
    var apiUrl1 = "/api/v1/cooling-centers/near";
    var apiUrl2 = "api/v1/weather-forecast/current";
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl1));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
