import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:world_clock_case/const/const.dart';
import 'package:world_clock_case/model/timeData_model.dart';
import 'package:world_clock_case/model/timezone_model.dart';

class TimezoneService {
  var client = http.Client();

  Future<dynamic> getTimezones() async {
    var response = await client.get(Uri.parse('$baseUrl'));
    return response;
  }

  Future<TimeData> getTimeData(String url) async {
    var response = await http.get(Uri.parse(baseUrl + url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return TimeData.fromJson(jsonData);
    } else {
      throw Exception('Failed to load time data');
    }
  }
}
