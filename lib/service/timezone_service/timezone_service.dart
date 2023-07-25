import 'package:http/http.dart' as http;
import 'package:world_clock_case/const/const.dart';
import 'package:world_clock_case/model/timezone_model.dart';

class TimezoneService {
  var client = http.Client();
  Future<dynamic> getTimezones() async {
    var response = await client.get(Uri.parse('$baseUrl'));
    return response;
  }
}
